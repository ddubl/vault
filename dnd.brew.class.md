---
id: mche96l9m56hozf78zwul37
title: Class
desc: ''
updated: 1686149929978
created: 1684956724533
---

rebuild class system on:
  types
    generics
    traits

## typification / classification

archetype: martial(proficiency(with martical weapons)), caster(spellcasting)
  trait defined; if both: dual.
character (class) type: [single, mixed, multi]&#x3A;
  total character class: cumulative type description
    total character class level: legacy character level
    derived character class level: cumulative character class level

martial: trait class:
  martial weapons
caster:
  spellcasting
specialist
hybrid

type:class: [warrior, expert, mage, priest, occult]
    warrior: [honed, sly, brute]
      attack [practiced, sneak, reckless]
      maneuver, focus, stance
      style
    expert: [artificer, pilferer, thaumaturge]
      expertise
    mage: [prepared, known, innate]
      spellcasting
      metamagic
      specialization
    priest: [divine, primal, eldritch]
      spellcasting
      channel

```
crucible: [investiture, imbibe, pact]
  invoke
```

  class:type: [legacy, base, sub, derived, prestige, paragon]

feature type: [learned, pilfered, crucible]
  pilferer:
    fighter: martial
    rogue: skill/item
    artificer: item
    bard: spell
    warlock: everything

## class type features

supertypes: focused (+50% type scaling), dip, poly: paragon requirements
\_ {class}:
  adapter: {legacy}
  base: core
    un-subclassed: generic: supertype features
    paragon: non-derived: acquired feature types congruent with base class
  sub: supplemental
    derived: multiclass: replacements; resulting from multiclass;
    fighter -> monk: martial; mystic
  prestige: multi/core/supplemental/replacement
  paragon: improved scaling?

## base class template:

{one phrase description}
traits: [class type]
unified basic features: extended in subclasses
extending type class features: {}
paragon features: {}
base class feature: {}

![[dendron://dnd/Progressions|dnd.brew.class.progressions]]

## feature
feature can be untyped
[core, base, sub, paragon, prestige, origin, kiln]
generally:
  additional resource allocation
  base class features are unspecific
    variants layer features on top
  abilities are preferably tied to resources, instead of binary cooldowns (per day)

whenever you choose character features, you can forego that choice and instead gain a feature that is at least as generic
!# class gets subtypes you can choose : a la cleric XUA22CO holy order
\-> 2 options + no choice.

%TAG ! tag:dnd.ddubl,class:
\--- !base

- artificer: ![[dendron://dnd/Class|dnd.brew.class.artificer]]
infuser, tinkerer

- barbarian: ![[Barb|dendron://dnd/dnd.brew.class.barb]]

- bard: ![[Bard|dendron://dnd/dnd.brew.class.bard]]

- blood hunter: ![[Bh|dendron://dnd/dnd.brew.class.bh]]

- cleric: ![[Cleri|dendron://dnd/dnd.brew.class.cleric]]

- druid: ![[Druid|dendron://dnd/dnd.brew.class.druid]]

- fighter: ![[Fighter|dendron://dnd/dnd.brew.class.fighter]]

- monk: ![[Monk|dendron://dnd/dnd.brew.class.monk]]

- monster hunter
  [ imbibe
  , prowl
  , quarry
  ] -> move into ranger; spellless)

- mystic
applied, retreat
  [ psionics
  , meditate
  , discipline
  ] -> immortal -> move into psion)

- paladin
priest, warrior
  [ divine sense
  , paragon/champion (divine presence/aura)
  , lay on hands
  ] \(vengeance)

- psion
derived class: typecast power source to psionic.
  [ psionics
  , raw talent
  , discipline
  ] -> awakened -> move to crucible -> improves arcane resource generation (or move into monk?))

- ranger
explorer, exploiter
  [ prowl(explorer, foe, awareness),
  , scavenge
  , primal preparation (+ability appropriation: primal)
  ] \(gloom stalker)[adaptable]
(hunter/monster hunter/monsterslayer, drakewarden/beastmaster, trapper)

- rogue: ![[Rogu|dendron://dnd/dnd.brew.class.rogue]]

- sorcerer: ![[Sorc|dendron://dnd/dnd.brew.class.sorc]]

- warlock: ![[Warlock|dendron://dnd/dnd.brew.class.warlock]]

- wizard: ![[Wizar|dendron://dnd/dnd.brew.class.wizard]]

## class types

all class types have empty/generic variants.
\-> ie. pick: generic metaclass warrior:
[legacy]
obsolete class, superseded by a newer version
[derived]
beast master -> drakewarden
: variations/sub-subclasses
just syntactical sugar that makes inheritance-like models more apparent
[affix/prefix system?]
class types are different than "caster - martial - channeler" character types that are tied to traits:
  if you have either
    spellcasting, maneuvers, or channel powers, you count as a caster, martial or channeler respectively.
other character types, such as alchemist, artificer or other professions are tied to proficiency in tools.
your proficiency bonus with tools can be increased by renown. See: Journeyman.

(invoke names/entities, cast spells)
'{arche}type
subtype: "tone/primary" - power: essence
(passive, primary, secondary)
warrior(honed/wit/brute): fighting style, maneuvers, focus
caster(learned/innate/pact): spellcasting, metamagic, additional access
priest(divine/primal/eldritch): paragon, channel, invocations

'{source}type
subtype: "kiln/secondary" - power: source
innate: metamagic, intuit [crucible -> temporary innate]
learned: acribic, ritual casting
pact: living spell

'{spell}type
subtype: "chord/tertiary" - power: origin
arcane: primary damage types: all/none
primal(prime material): primary damage types: elemental, physical [primordial]
divine: primary damage types: necroti/radiant

pure / non-subclassed // rule for class name alteration:
ie. wizard(caster, arcane)
  diverging subclasses: 2 tones ie. wiz::bladesinger(caster, warrior)
  focussing subclasses: count a subtype doubly ie. wizard[subclass]\(caster, caster, arcane)
focussing multiclasses? -> monk: you do not gain additional features, but you count your monk class levels as 3 levels for the purposes of gaining additional traits in your primary class
balanced multiclasses: lose primary class, gains an additional secondary class
mixed martial classes: style

### meta

#### warrior

  honed(balanced; any style)
    :maneuver, power attack; all Weapons
  sly(emphasize dex/precision; dice conversions and additional effects; precise styles)
    :maneuver, sneak attack; Dextrous Weapons
  brute(rage; typecast certain ability score to str/con; brutal styles)
    :maneuver, reckless attack; Strength Weapons
    \-> intellect brute(psion!): typecast everything to intelligence

  adding subclass options that improve on the specific nature:
  \-> speeding up spell progression (2/3rds caster): every 3 classes count as 2 additional as to spell progressions. Rest: 1, neglect. Rest 2 add another 1.

super (spell slot progression, trait doctoring -> supplanting traits = grafting)

- spellcaster(cantrips, spellcasting(+ritual), "meta"[metamagic, scribe, pact])

  - non-
    barbarian, fighter, rogue, monk, bh, mh

  - half- -> construct by stacking martial with caster?
    \-> divine smite, nature's wrath, x-infused
    (paladin, ranger, artificer) third: [profane soul, arcane trickster, eldritch knight]

  - full-
    \-> feature regaining slots (outside of short-resting)
    (druid, cleric)(bard, sorcerer, wizard)(warlock)

- martial
  - maneuvers (martial cantrips/spells)
  - focus (requiring resources: concentration)
  - drills (resting activity, temporary buffs, debuff removal, equipment prep, spell-like effects)

- expert
  - expertise
  - stroke of genius
  - escape strangling specifics (enhances trait tinkering)

- hybrid type (mixed?)
  : feature converts spell slots into
  \-- [armor, cantrip-type, weapon]
  warrior, derived classes:
  \-> "half-casters"
    spell-like ability, fueled by expending spell slots

    paladin (cha/wis)
    (medium armor, maneuvers, mastery(longsword), non-finesse martial melee weapons)
      \-> convert smite spells into abilities
      channel divine - smite: if spell prepared, add a smite effect

  ```
  - aura: self and allies
  ```

    ranger (wis/int)
    (light armor, maneuvers, mastery(shortsword, longbow), finesse martial melee weapons, non-firearm martial ranged weapons)
      \-> traps, consumables, temporary enchantment
      channel nature - imbue: consumables, crucible

  ```
  - triggers and traps -> traps
  ```

    artificer (int/cha)
    (heavy armor, mastery(tools), firearms)
      channel arcane - infuse: spell-like effects to equipment

  ```
  - aura: lasting on equipment
  ```

  monk(extreme dedication: double progression, no additional features),
  psion(raw arcane(psychic force)),
  mystic
    psi/chi (psi -> chi: "bodied" psi)

  - replace innate casting somatic component with an {unarmed strike}

metaclass: "pick" mechanic
subclass-less: "pure"/generic class{archetype}: counts as a prestige and paragon class.

- gains quicker progressions by foregoing subclass choice
- more resources?
- gains "featureless pilferer"
  other means of acquiring paragon traits: high level (sub)class feature

## paragon class type

warrior / priest
  exemplar - champion - paragon
caster / expert
  arch{class}

paragon of:
  might (fighter/psion/barbarian); primary ability score over 20
  cunning (bard/rogue, through paragon pilfering); over 5 different classes in traits
  {deity}/{circle} (cleric/druid); casting ability score priest over 20
  power (fighter/paladin);
  arcana (wizard/sorcerer); primary casting ability score caster over 20
  {any: warlock};

warrior paragon -> champion/cavalier (warrior/warrior/warrior)
  fighter: typecast any martial ability [typecast]
priest paragon: choose invocations paragon progression (priest/priest/priest)
  primal paragon: channel: elemental wildshapes
  divine paragon:
caster paragon (caster/caster/caster)
  wizard
    scribe: typecast spell-like abilities into arcane spells
    onomant: drop material and somatic components, power words, smaller spell book
warlock doesn't advance any other progressions. typecast class; crucible;

## prestige

### meta

warrior {honed, sly, brute}
expert {artificer, thaumaturge, pilferer}
priest(divine, primal, eldritch)
caster(arcane, innate, psionic)
occult(pact, crucible)
\-> crucial distinction: no-spell-progression, half-spell-progression, full-spell-progression

##### caster

core: spellcasting/magic tinkering/
  wizard: scribe/memorize/alter spell

```
- scribe anything, artificing
```

  sorcerer: intuitive alter spell -> metamagic

```
- multi-casting, volatile/wild spells
```

  bard: intuitive/honed
  warlock: make their patron's magic their own. #f? -> priest?

```
- living spell, granting pacts
```

##### warrior

core: maneuver/focus/drill

- fighter: allrounder/technician
  - fighter:battlemaster:: all maneuvers/exploits
- rogue: dexterity
- barbarian: strength

##### priest

cast/channel/pray

- cleric: divine
- druid: primordial
- warlock: eldritch

#### occult

##### crucible

mutate/concentrate/research

- apothecary
- blood hunter (completes the paladin/ranger trio) -> mixed base type?
- monster hunter
- living crucible

##### innate?

- sorcerer
- bard
- psion

##### expert

\+/craft/focus/invent(flash of mind)

- artificer () - expert: arcane
- monk:
- bard

##### arcane

- arcane = mystic
- innate = sorcerer
- caster = wizard

#### mixed

##### mixed

  associate your spellcasting to a mental ability stat
  associated spell-ability you can convert into abilities (like smite)

- paladin: divine (pick associated mental ability stat)
- ranger
- artificer/warlock?

\-- warrior

- warrior: monk
- expert: fighter -> battlemaster
- primal: barbarian
- divine: paladin
- arcane: bladesinger/rune knight
- psionic: psion/psi-warrior
- pact: hexblade/eldritch knight/oath of vengeance
- crucible: crucible knight
  \-- expert
- expert: bard/rogue
- warrior: rogue/fighter
- divine: thaumaturge??
- primal: ranger
- arcane: artificer/arcane trickster
- psionic: soul knife
- pact: ??
- crucible: blood hunter(mutant)
  \-- divine
- divine : cleric
- martial : war domain/forge domain
- expert : trickery domain
- primal : tempest domain
- arcane : arcana domain
- psi : ?
- pact : twilight/death?
- crucible : godeater
  \-- primal
- arcane
  \-- arcane
  \-- psi
  \-- pact
  \-- crucible