Return-Path: <linux-rtc+bounces-4062-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C39AAF2CB
	for <lists+linux-rtc@lfdr.de>; Thu,  8 May 2025 07:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07CB54E1D8F
	for <lists+linux-rtc@lfdr.de>; Thu,  8 May 2025 05:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3636821018F;
	Thu,  8 May 2025 05:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hlsh8SJL"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2050.outbound.protection.outlook.com [40.107.247.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCA62A1D8;
	Thu,  8 May 2025 05:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746681713; cv=fail; b=bOLgT/IkK1uikb8gAORS1r8zf+xoASM8M48YNSn8pzzy3tflWPD1MSi2rElnTXJrVSkEqdbTlpw6VCwwQUSgKBW7BFhoGa7uB9tDBT2Vp1QiffsKIm+Kpw9O1G4HWH6wayJ9WOcc4LbdqPgCpNobEFXJiJ/0uM3buwUZISoS9zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746681713; c=relaxed/simple;
	bh=JQDfNX8OjtHnqpma4hl7+v/4cPDxCqdGfxuT2qoTRcA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r1LR7YVtz9Qk8YOLC+jrewJoasmiZLMQqKcvN48E8RxxhLnIDzwXP6dRgstMEnpB0ZdiZoVaOafdui+KSgac9XnCIDUB8ill3MrhzITzhZJNtjGO0mraWrdlAlt8rJ3Tf2Z0X7/5yHXVD4fCCRCw7EiB9SOQLQHFOT1BeebBbXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hlsh8SJL; arc=fail smtp.client-ip=40.107.247.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJrwPzk0xNa59tDA7u39VOPjYh1p5IY/4ShcjgfIJ2GdYYZHALmUeOslj+PGtuFbZYKbInNW9v+OEB9pfYYVjRNv6y4/AmEQw2H9mIGzW3TNOcZ0nqDwIkUIbIjGt5tgogrS5QCRJg197DYzot1weCvpFurNy5RSZ/RTB02m/nAAOfsjZYEYyGmOhjI6aSb6aPYOfBcymzXveIGqW6zp0PzIwydgeWqHcXfpqKA1jKfUAddR+s4VXi1bc8os/p7EERZra6jhBdweVTdXTiWAZkBeliIgl8j5gVEtECusPEW3kgS0Ru+WbehTikEPxZ/S18ygzevWb7md/A5pi1lWig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UltI0DEYBO44PagaeNfXHPPWtrE1XjJ51zxhhVOcLF8=;
 b=C9G4/TmHxYB189TlntzVnJgGpzDK7A1HZvpLFXwkjkDEIHffTA5yk5Md/7dOiHIr7iuZa5cHXwMqRgvEpoKZDicxcOeD0/lgqwljuw3gKFhsCqGTxnJCh6Wrp1Y8YMyQba3Qy9tZrlwY2RmpV10qTqxjtbb/ICt0APOy/Ki3qu6weiqfdzMwwgST3ZzfmCoZvv/lEW5Qjk1GhtD1YIpqmPXN/SPLDNU23dK7hhx1moQtTo3f6acdmapj7BWrYzO6inl9N3HDFWKnBQ2EXw/Ssjb7JiSduH2NZLnIbiuQxXhhRX36TJG63gyqvitMLNy2EE/nSLGH0bv/FO/NqsrCDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UltI0DEYBO44PagaeNfXHPPWtrE1XjJ51zxhhVOcLF8=;
 b=hlsh8SJLQuHmkGPQriFrwuV789FZA1jSTzb71wo1F66y0jRLH5bfa9fIjyT8aXpYM+qRdrhT4pfPhIzsiT+aOqjKPhyW+WTIJokwOgFX09Z0mxJ9BAVbmsA7n7W2RVC+4Q13KI1PzVUSKZX4gVWfQIyoc0oVRfuQRFQJtuxmysMZr+urg1C+XbMimTSjNcJCD/qjxWgw/s4maHnr6fYAGZ3e0u0pd4i0hahDY7TP2Yqrf1HuqPRzAq+ZarH9SBcMfFGZiF8DPuxa4qGn/o+pPwgHMfGyTB3zRAuHPcfVHnGqEjpYtixR74f3joeOmR7w0gjq/OTqReA7mgxbNWCsUg==
Received: from AM0PR04MB6515.eurprd04.prod.outlook.com (2603:10a6:208:16f::10)
 by AS4PR04MB9241.eurprd04.prod.outlook.com (2603:10a6:20b:4e0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Thu, 8 May
 2025 05:21:48 +0000
Received: from AM0PR04MB6515.eurprd04.prod.outlook.com
 ([fe80::ca11:63b8:aeea:8043]) by AM0PR04MB6515.eurprd04.prod.outlook.com
 ([fe80::ca11:63b8:aeea:8043%5]) with mapi id 15.20.8699.024; Thu, 8 May 2025
 05:21:47 +0000
From: Pankit Garg <pankit.garg@nxp.com>
To: Conor Dooley <conor@kernel.org>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, Vikash Bansal <vikash.bansal@nxp.com>,
	Priyanka Jain <priyanka.jain@nxp.com>, Daniel Aguirre
	<daniel.aguirre@nxp.com>, Shashank Rebbapragada
	<shashank.rebbapragada@nxp.com>, Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: RE: [EXT] Re: [PATCH v3 1/2] dt-bindings: rtc: Add pcf85053a support
Thread-Topic: [EXT] Re: [PATCH v3 1/2] dt-bindings: rtc: Add pcf85053a support
Thread-Index: AQHbvyFWcjUresCpX0SM58nE89m7ErPHOM0AgAD6hsA=
Date: Thu, 8 May 2025 05:21:47 +0000
Message-ID:
 <AM0PR04MB6515B27367279C935A295379E78BA@AM0PR04MB6515.eurprd04.prod.outlook.com>
References: <20250507072618.153960-1-pankit.garg@nxp.com>
 <20250507-zap-dyslexia-924cfd1b6ec9@spud>
In-Reply-To: <20250507-zap-dyslexia-924cfd1b6ec9@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6515:EE_|AS4PR04MB9241:EE_
x-ms-office365-filtering-correlation-id: d2c5203a-db0f-467f-94ff-08dd8df03b07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?PfmvX+XRQioaj766zfSnLnFisFVYEBjbOFqYxCsZMHCrHVmtZPCmIli699DQ?=
 =?us-ascii?Q?lafk5iULnQY+ZVCH8YvlzfjryvhUUtEmIQL+4gZPbBqaPleQ5cXRQXIot9Im?=
 =?us-ascii?Q?s7BqwBqA4tge7SxGwVGQ4Ylc49K3xaEOjo0TuPlcBb25SUv6lNl2qe1KObYo?=
 =?us-ascii?Q?LBRA7lqLrUQnbO5/GGSoSbLREzwkoQISkIwoK/mCtDPeujOeLd8PmOY0C8sI?=
 =?us-ascii?Q?jjZZM7n3rNfFglR0b+9tS1LOkbgJkwxJa/oDRJyw8yv+lp7gYRwiK4WJ/w+0?=
 =?us-ascii?Q?FEO+6s/kEM/XD+24pyI+EQMgCQSrKoxq9cmchcd3xTzcNrpECMb0QsrD+SPy?=
 =?us-ascii?Q?HVouIbPUGTtMH46oWruBU4LxA+T+8Rzc4FeNuXTubWd8BeNkoZy+H9VEmcpo?=
 =?us-ascii?Q?J19D9Mpr8cP+fU527I99FpbkSn5u2W1q/3pIP8HguI/TiEHTeOhbvzMILWhX?=
 =?us-ascii?Q?36/0oLtE3tmxiBnH8Iiu7F+7r0AJoCUmQbl0ucPBXRHpaiIdI5hA19QRnHkr?=
 =?us-ascii?Q?PXMDRX4/Pe0FKOxjEIm0w/TchQr/SC6psfA83uFwYtXLSZJRuJJplsYVDz+h?=
 =?us-ascii?Q?IIpFFojnS8cyOHX0uMvz4ofDdSHDsv0siXMxNx/qTH+Zxx8/X+8gu+NqAtil?=
 =?us-ascii?Q?9vRpleopM+7esL+FLHJINaus7881idD0MMPyYd4BJ/4p5YJ+JVZjo7QOEJQI?=
 =?us-ascii?Q?aQUuJM20zrOGQz+SMTlQ8oPzv3w3X6tC7cxmEtR/HGkVSjRABVbENdEdtj8v?=
 =?us-ascii?Q?rqVhqP22o8U/HWynqJF+6MTNAsGBgmMZT94Wghf/roOSEnvfiD1BlK5PW6My?=
 =?us-ascii?Q?jdtDTYAuPDrpzha+HUXSrB+Bs+kovaU+hOn5XjLaNqPK2O8TAD8gV9fY1d5k?=
 =?us-ascii?Q?AFDp4URAQSlAoc3LS3lhcKeEn3Val2S9Fqws8RjHJvsyEo/NrdHZuSXbZhOa?=
 =?us-ascii?Q?vsIDRXueApBZ/WS5h7jJpOX3dOaZy0ZyrNKzIiOh1khjPajvgYbrWBafX08N?=
 =?us-ascii?Q?eEps64E6TxSVtS8gZ0QhCToT3LSn9TU1Jx1kraD5qrSbOr37S3Z5yjMKtwQA?=
 =?us-ascii?Q?BImHdLEpW9j1wzirBvTddWl2i9mldwTGrNtvOKmSTSoSTu3sY1cDIxabn0Xi?=
 =?us-ascii?Q?qyxi4n9QPMhreFtChPWxuX/9nyRCjUGJO/IxVVQRvdmSlXBpe3Xbu45h1Q9F?=
 =?us-ascii?Q?XRjxLv3TA7IMy4qBx3L1/Qng8RsqgsgfOASEeI3VOo2g+3q8IvgEodR/9i5S?=
 =?us-ascii?Q?iHZxDR8Zd1u7dsU2XIvBGHAFx956rNJ65re6bc0jYazi5fHIXg0LEIvb6km1?=
 =?us-ascii?Q?IijPD7xgKyLPApneoEWsn3J235LiZUy+lkuE3XmOxuY8aHf6QVK0JttDz6CW?=
 =?us-ascii?Q?qB+Tct/YLR1BCUrecu+j5r7n4ozXNJ2imBWRglQ3GEBchjT/WiwOlZCBw6Z3?=
 =?us-ascii?Q?ounq9xU6PLFmLKv6CPy7gYPqHF9I6fobv0HqNX0rMyDP1LTNTyKo7cDxxWxX?=
 =?us-ascii?Q?BtLNYUz7ZscX1/g=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6515.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?0LMahcssltZqQlOOtY/6hFI1qAvugEz+PUPCLQZTcbCHIbYs3G6C4u632hxx?=
 =?us-ascii?Q?lI+0COlsrh5D8AqlBcWh0RgufFS8/v45IlMuotW2VV5jVejxUd7EbjJRex9s?=
 =?us-ascii?Q?YVSdqohCVz+f6QZY71IRb+KKArpBxccUDGcpyl37OoOgWafBqD+4IqsvNYCb?=
 =?us-ascii?Q?CtyHeqA6VfoDEMQN6LTPVTTFeMITMbutoBQ2s2SjN9KS+nwZrhAIaPkZLOeg?=
 =?us-ascii?Q?VYgq5eAfhgEA+bc7WcXAgZVK/kOVHGEzt50ERSFl7qUsmHtqScZpS635v2un?=
 =?us-ascii?Q?pg/iK27czoEQrIC7SQacs+LLYkDMAOTFnLeBYlOAOkEl4nfkqBRWEPGI0gbj?=
 =?us-ascii?Q?1XiJbRTsodWlrx29jPpmvFR6bEfhYGOtWgvgiACFJaA+Hnm2a2ZOBkPolNWu?=
 =?us-ascii?Q?uHthUbTi+1ISolNEsIQY778wBTdk+dl1gRX/URzn4NBqdZVrly4EWqq28CYK?=
 =?us-ascii?Q?DuQZsp4uk2OU3qX/tO+nVDHSS9y1np4TifMnZ2QaEBu5HVFFbhWqIizOGU1Z?=
 =?us-ascii?Q?Cscz5/0aufYztVHObYJ5CDnr3selVe7BCfeDfuzjt8oJcccjQn4WklHaZ9da?=
 =?us-ascii?Q?zANhTp014KApDGKiCmd2zMn9QCLTMrbDo6DhmebS4RFfBEieoXGAj/RScCK+?=
 =?us-ascii?Q?63wXt7E9zruegOzQiEZtxAvtuMbB5HMikZTaD+YkQn5edJokJ1elhLi232Lq?=
 =?us-ascii?Q?zRdKdXbkMekS0bwjHRg+5tGKjKZO7MqsglCEmEdMgS+FDdK8uhp61a/UBhQ6?=
 =?us-ascii?Q?3up38h8X/7GlOgcVkiMoxrrjtDSZOzN18B+VhP+yzCYtNXJJVmYBhL4K/TZ5?=
 =?us-ascii?Q?Y4O57l/wzVI3nu6ctdZtdEjqoHS74GQxw3522L6pEz0ROJ6AV9k9DWbGs6SQ?=
 =?us-ascii?Q?BDmI7sOkqhDQnQ2wzdSvJzSTZiL/BJG0diYTFAMNEHL2tAy03ThnGau3/Gjl?=
 =?us-ascii?Q?IeB/vLyKwuJW9dlHK2ndj5dGf1HMY/jVWrB6NK745UHzELqpRrMQTg93oMlZ?=
 =?us-ascii?Q?YbFV1Rq0zAak/voV8STNoeEEDgNMem871fFFbVrBbPctOMVC5qrcrRoidBFr?=
 =?us-ascii?Q?dykKv1Ch4b5yflfXmglpBI/epzWL741rM7E9QlFBKQUlGRdxlkfqAPqvwEos?=
 =?us-ascii?Q?ChUxz8F5OthU3Ats9en1ZdGA87+2OyP2JAs6bQLdKuqOh3yrj6WG2AshePIp?=
 =?us-ascii?Q?6oVYeqh0OORvmtuSlq8F3wbUOG5B3qGqND6kZxEkwywgBHwqFdDK38bYIuUc?=
 =?us-ascii?Q?1OT56yuMqvGMhadLkM5VTXRo9ZdBoxnmkT0Zs9EcVdzNKWlz0cEzgUoPEwB8?=
 =?us-ascii?Q?HGAqWXDkymDpKWnuTO3O+BO7TonwB1Awwr9gcbHyFI1Xg75mqAlrZXBbUNeU?=
 =?us-ascii?Q?WMY6cW5kGGMvvPyxDoJt8l7Bg8Kf2tyuPBK1g0IhhZLB29WyZvTFnkVYteYM?=
 =?us-ascii?Q?MDv+NHUyPRFh7ZqIeOh6r1lI/9t575O+XeJyhXOilOlpIm7zkT+4p3qzyGjQ?=
 =?us-ascii?Q?Wkyf81sA9rgtp+eHptjMkqjfSrI2RU+VZNeY3PPEAJsB1f1ZUaJfwpTwvl35?=
 =?us-ascii?Q?NIHZycwliPA2cpthAxAcSaUmgpLdc6o6hEZ+M+Ul?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6515.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c5203a-db0f-467f-94ff-08dd8df03b07
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2025 05:21:47.8008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gg3sPVXxh4pko2AFwib4RLD0kbhpn3poKp3OP0X/hHbZ04ceRAlxZMKblBJRzT4aHokOkxHRB4hwWYVEIE49uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9241



> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Wednesday, May 7, 2025 7:53 PM
> To: Pankit Garg <pankit.garg@nxp.com>
> Cc: linux-rtc@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; conor+dt@kernel.org; robh@kernel.org;
> alexandre.belloni@bootlin.com; Vikash Bansal <vikash.bansal@nxp.com>;
> Priyanka Jain <priyanka.jain@nxp.com>; Daniel Aguirre
> <daniel.aguirre@nxp.com>; Shashank Rebbapragada
> <shashank.rebbapragada@nxp.com>; Aman Kumar Pandey
> <aman.kumarpandey@nxp.com>
> Subject: [EXT] Re: [PATCH v3 1/2] dt-bindings: rtc: Add pcf85053a support
>=20
> On Wed, May 07, 2025 at 12:56:17PM +0530, Pankit Garg wrote:
> > Add device tree bindings for NXP PCF85053a RTC chip.
> >
> > Signed-off-by: Pankit Garg <pankit.garg@nxp.com>
> > ---
> > V2 -> V3: Moved MAINTAINERS file changes to the driver patch
> > V1 -> V2: Handled dt-bindings by trivial-rtc.yaml
>=20
> You forgot to add my ack.
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Yes, I forgot. I will add it in v4. Let me wait for more review/comments fo=
r couple of days.

>=20
> >
> > ---
> >  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> > index 7330a7200831..47be7bbbfedd 100644
> > --- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> > @@ -65,6 +65,8 @@ properties:
> >        - microcrystal,rv8523
> >        # NXP LPC32xx SoC Real-time Clock
> >        - nxp,lpc3220-rtc
> > +      # NXP PCF85053A Real Time Clock Module with I2C-Bus
> > +      - nxp,pcf85053a
> >        # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
> >        - ricoh,r2025sd
> >        # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
> > --
> > 2.25.1
> >

