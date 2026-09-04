import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../design_system/design_system.dart';
import '../../domain/repositories/route_bridge.dart';
import '../bloc/route_bridge_bloc.dart';

/// Sharing the route with a phone, a tablet, or a second PC.
///
/// Two halves on one page, because a machine is one or the other and the
/// commander should not have to say which before seeing the choice: the game
/// machine publishes, every other screen reads.
class RouteBridgePage extends StatelessWidget {
  const RouteBridgePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RouteBridgeBloc>(
      create: (_) => getIt<RouteBridgeBloc>()..add(const RouteBridgeStarted()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Partager la route')),
        body: const _BridgeView(),
      ),
    );
  }
}

class _BridgeView extends StatelessWidget {
  const _BridgeView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouteBridgeBloc, RouteBridgeState>(
      builder: (BuildContext context, RouteBridgeState state) {
        if (state.isLoading) {
          return const EdLoadingView();
        }
        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          children: <Widget>[
            const EdPageHeader(
              kicker: 'Multi-appareils',
              title: 'Suivre depuis un autre écran',
              deck: 'La machine de jeu publie ce qu\'elle lit ; les autres '
                  'écrans le lisent. Rien n\'est hébergé, rien ne sort de '
                  'votre réseau.',
            ),
            const SizedBox(height: 16),
            if (state.failure case final failure?) ...<Widget>[
              EdCallout.warning(
                title: 'Partage impossible',
                child: Text(failure.message),
              ),
              const SizedBox(height: 12),
            ],
            _HostPanel(state: state),
            const SizedBox(height: 16),
            _ClientPanel(state: state),
          ],
        );
      },
    );
  }
}

class _HostPanel extends StatelessWidget {
  const _HostPanel({required this.state});

  final RouteBridgeState state;

  @override
  Widget build(BuildContext context) {
    final RouteBridgeBloc bloc = context.read<RouteBridgeBloc>();

    return EdPanel(
      accent: state.isHosting ? EdColors.green : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const EdSectionHeader(title: 'Cette machine publie'),
          const SizedBox(height: 8),
          if (!state.isSupported)
            const Text(
              'Un navigateur ne peut pas ouvrir de port. Lancez '
              'l\'application de bureau sur la machine où tourne le jeu.',
            )
          else ...<Widget>[
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Partager la route en cours'),
              subtitle: const Text(
                'Ouvre un port sur cette machine, sur votre réseau local '
                'uniquement.',
              ),
              value: state.isHosting,
              onChanged: state.isBusy
                  ? null
                  : (_) => bloc.add(const RouteBridgeHostToggled()),
            ),
            if (state.hostPairing case final BridgePairing pairing) ...<Widget>[
              const SizedBox(height: 12),
              Text(
                'Code d\'appairage',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(height: 4),
              SelectableText(
                pairing.code,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: EdColors.gold,
                      fontFeatures: const <FontFeature>[
                        FontFeature.tabularFigures(),
                      ],
                    ),
              ),
              const SizedBox(height: 8),
              Row(
                children: <Widget>[
                  OutlinedButton.icon(
                    onPressed: () => Clipboard.setData(
                      ClipboardData(text: pairing.code),
                    ),
                    icon: const Icon(Icons.copy, size: 16),
                    label: const Text('Copier'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const EdCallout.info(
                title: 'Si l\'autre appareil ne voit rien',
                // The number one documented failure of EDDiscovery's web
                // server, and the reason it is named here rather than left to
                // be discovered.
                child: Text(
                  'C\'est presque toujours le pare-feu de cette machine : il '
                  'faut autoriser les connexions entrantes sur ce port. Les '
                  'deux appareils doivent aussi être sur le même réseau — ou '
                  'reliés par un VPN.',
                ),
              ),
            ],
          ],
        ],
      ),
    );
  }
}

class _ClientPanel extends StatefulWidget {
  const _ClientPanel({required this.state});

  final RouteBridgeState state;

  @override
  State<_ClientPanel> createState() => _ClientPanelState();
}

class _ClientPanelState extends State<_ClientPanel> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.state.clientPairing?.code ?? '',
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final RouteBridgeBloc bloc = context.read<RouteBridgeBloc>();
    final BridgePairing? paired = widget.state.clientPairing;

    return EdPanel(
      accent: paired != null ? EdColors.cyan : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const EdSectionHeader(title: 'Cet appareil lit une machine de jeu'),
          const SizedBox(height: 8),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Code d\'appairage',
              hintText: '192.168.1.24:8420/k7m2xq9p',
              helperText: 'Affiché sur la machine où tourne le jeu',
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: <Widget>[
              FilledButton(
                onPressed: () => bloc.add(RouteBridgePaired(_controller.text)),
                child: Text(paired == null ? 'Appairer' : 'Mettre à jour'),
              ),
              if (paired != null) ...<Widget>[
                const SizedBox(width: 12),
                TextButton(
                  onPressed: () {
                    _controller.clear();
                    bloc.add(const RouteBridgeUnpaired());
                  },
                  child: const Text('Oublier'),
                ),
              ],
            ],
          ),
          if (paired != null) ...<Widget>[
            const SizedBox(height: 12),
            Text(
              // Never a "connected" light: the game only rewrites its files
              // when something changes, so silence is normal and a lit lamp
              // would be a lie. What travels is the age of the answer.
              'Appairé à ${paired.host}. L\'écran de route affichera l\'âge de '
              'la dernière donnée reçue, jamais un voyant « connecté » : le jeu '
              'n\'écrit que lorsque quelque chose bouge.',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: EdColors.textMuted),
            ),
          ],
        ],
      ),
    );
  }
}
