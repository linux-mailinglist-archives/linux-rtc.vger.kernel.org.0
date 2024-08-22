Return-Path: <linux-rtc+bounces-1693-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B3C95AD1F
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2024 08:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A8BC1C22428
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2024 06:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61CD7A15B;
	Thu, 22 Aug 2024 06:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bzJi/JdY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011023.outbound.protection.outlook.com [52.101.70.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334932AF0D;
	Thu, 22 Aug 2024 06:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724306533; cv=fail; b=D+haUJmDS2bZ1IOo7oQcgwDlbsLlEeqTUkgy8uM6s3tSw7S7zYrulcZOjiLtXL//9ugaHLo/JbBmCJF6AwCRG9hx7Rj8KgXHzNXgVRMh1ICh8YgWrIm7JkNzJ5bzQ8QczfaIdqIwzEfZuFL5MtomY2DEE/qf4lKc0lUnLZOJov8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724306533; c=relaxed/simple;
	bh=6Hu8BbZN6rzsyy+yirg/AMeqAgpc++ky7pazC9z67hE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YyQMuDELi8g+A38HmHjiDoaKkBkmHm9ThY9P3sUp3wL7oC4nJoI4kgv3RvqLDvsWhbc2c2/bBmCaecPzfv1qABffQPSTy/5UOXlOhCnlOzrUl+/Yo6pNnSJwF6XWqjlCAiUazE3/F7PnON63zMF2B6+nQWwiUiGuTMBAIRC4Kzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bzJi/JdY; arc=fail smtp.client-ip=52.101.70.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qq5r54lZmA+RYRfsvlZak4gl8AEc+/ptQ2Voq3l2l5kdvXOjADqOfG5Kfnhkio1CVAc//4i+H3gMigJDGISofEKC6IZfFEhbQsBLkBVD4RriLnksBwSiMH8mNmrTgEJx6CHnkEukYf2cy5dYv5/FkbL3+iNfQYILPDyxIfOtWu4JIY2UuI6akA8n2sYRYmB1sawt9l2HVKqatGJc43Sj57XbWhB8+H69LGbJI1uxz3GgB2CYAwm0HPSBOhBp86opkVqovjEpuTH5lmzF4guywxqfuAPEQPvFwIyRs3aK8F6JlkAh4D9KFPU7cUbl4Qg+Ut2vf+XlCpoytUWg1H+PKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cnak0VoDF26RCgLMQbWfzxCCOqTd7xtYrcnhh+TKsfU=;
 b=oji5+LDIyXKihHfyZQdO+3nIwgg2qIu1Tkba0ZIJnUg4bY3f5+wflfOTyGGl1W9tf6hIKtjq2E+67iwpCwdKofZZ43Ak8RgEzqikYEf6BGhnh+35dflcdbSCRy7YeGw8WTDIOOtiSRCck0omLsw5vMpfQF87keMA+7DOEqeC1LH6ff5AFRXBtNmxAVdvTTgPoiHBPIKdvpDiyyB2Qfezvt0fVrGxnoVfdI+rpesoU3IOmNz2aI5EoZABDwctByRUo7YljtOe4NllZF6FRA9VUjL1hfJ2qdPAUaXDMWcwsMmrg0rAVkW26BCT0wPuBU+qUm/YayX3lSZt2XQlqoBB0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cnak0VoDF26RCgLMQbWfzxCCOqTd7xtYrcnhh+TKsfU=;
 b=bzJi/JdYnhc17yYKpw2s1zWPOvmqzxjZIIaNF0g3+IJ1kyEscYPP3Wf1ekW9Cw/ZYsllC4btuHfscIDMk+ED/UU8+AVhbp6zB3f0bmIWD2SddoIcltcMEhWabeg6z4gDcErTdMwAIhoKEqsf09HG/rQXgygsA5TKp8xqkfMXIQ++45ASFFX16B0xma3ZnSU1+eSd/Z32p+jtdarnoH2Xu1Z7Y84SG/VN8+BsMuWU9gxJ6xBwTcPZF3RhZF5+4BczfhCPXh1hIZTYlaucfUIK38FkH4hfo8uMgTwOotXQ+JqVCHZDlYh61nTbmiPGDhlIdp1zsCqgvqurlKt3+A4vKA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8783.eurprd04.prod.outlook.com (2603:10a6:102:20e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 06:02:07 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 06:02:05 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi
	<cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>
CC: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH v7 0/7] firmware: support i.MX95 SCMI BBM/MISC Extenstion
Thread-Topic: [PATCH v7 0/7] firmware: support i.MX95 SCMI BBM/MISC Extenstion
Thread-Index: AQHa40fEPyVCotchkEOnFP0xvgvrn7Ip1eMQgAkUKnA=
Date: Thu, 22 Aug 2024 06:02:05 +0000
Message-ID:
 <PAXPR04MB845947383F2F5469B04E92C4888F2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240731-imx95-bbm-misc-v2-v7-0-a41394365602@nxp.com>
 <PAXPR04MB84591BA31D74C164E59A3B9688812@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To:
 <PAXPR04MB84591BA31D74C164E59A3B9688812@PAXPR04MB8459.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PAXPR04MB8783:EE_
x-ms-office365-filtering-correlation-id: e4d0ae9a-2771-4c17-c22e-08dcc26ff2e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ckOQABEJ3Um8c81RJmIThktJXTV3JfS1o8qG/ueUKXGM/DAJVw3Qc9tWqFzS?=
 =?us-ascii?Q?bjy3ikXy4EYW97qo5432zn/BkMYxRvdzb7/pXAimFgaU9ZcEq2MkEsr3YHJw?=
 =?us-ascii?Q?8BT0kH6OAKzNXXw6/67PyGOMeFnttzOUKN9f9BPeeGvjutXr97cf5uf3lua1?=
 =?us-ascii?Q?R+9o6u4nO1xUBX7ScweaSeQRwMECTNhhN+GMWhJHfAP+PpgQIQW5IZYWzjUa?=
 =?us-ascii?Q?H9a9zj+ytUdwcweJkbnX3NkDlMDLxFywFffHSSaValFCtjD/auGdUSGu8sNv?=
 =?us-ascii?Q?0AsI9ljtNJYGz7fodjax1Zf9ah2mhBZryCUQWrn42IpfEMxrdZLf1czYflKU?=
 =?us-ascii?Q?TJWAc2KoDZfYYu7rD+AXM5mPkjp7vV176UpTQg/447tdamoGtRkJ5LYR6fG2?=
 =?us-ascii?Q?2MTEAqf9QV7fY3ciVOvZ6K1lVb0F/8vyuEJsQe31eUxdFHCObIqsqx1UKQo8?=
 =?us-ascii?Q?rQ2WzLO7wvtOj/e1svoieerhx/Hm49l5ZU3f9u76QmgoTNHksH3mQdgIwidw?=
 =?us-ascii?Q?d/G4uaeMKHN1sso+mBE9pGs/T/RTKqIbCxEr6vYpHxbSNnD/cocibAjm9tWI?=
 =?us-ascii?Q?UaAE75mIPFxfPkxuwz9rXwVnNvj4BDlBUr+Lxhsa5oXXO3hEwN/WFZPA3f+t?=
 =?us-ascii?Q?IGfP2x4rdGSilui7CheU1C4p4g4jvMxYruMIDzTCncBBmIQ/H9Bz30ylZ9wz?=
 =?us-ascii?Q?tZxNcivZIcD1j70TIIT5sB9ABYlIebtMv7KZ73jM5zZIOp90FAd/96whPJhJ?=
 =?us-ascii?Q?q2SlJNOFGwLzgbp5mFHkrKIWBSHpIP5vAHg3JWRqeitTyk8UAJAHC9Irm+Kg?=
 =?us-ascii?Q?qZuLicjig05Qyp0erG+v8GpB69GOaEMeF/IxAxw4attb4ix/7F+SvtCowWG3?=
 =?us-ascii?Q?Y0wsfLQeeVgIXLOQDaINkj+TjsvkaBRNTBeOfA/1qz6+FwX7eelTihCo90o6?=
 =?us-ascii?Q?AtHKc9iRT9ggRJAG5/tWGLSHdNjovr0w7hKBYmukrpBQb+tX3e6FeiiNbOJe?=
 =?us-ascii?Q?9GxzgSHO6+QBD8DZ7zNx8WAfUT8kJ48O0jukvZmD9WWsKu4AHBsfvBjZ0Mrn?=
 =?us-ascii?Q?yuoNo4YlXCAbcNgdHpW6cAJvlxJR4RUEkdqImKKbOmfDAr0exFl50f6b/xom?=
 =?us-ascii?Q?6vWJlDV66IchzXuCdYZ4CMDESgSd3+gbRp1coT0qMz7KKXGYZ/q7DRS9x+6W?=
 =?us-ascii?Q?+xvOnhbbBayA4ZV56y1TxnXVbbGFbS3f7b8biqso1g1vGWA+RxPQL8qOiq7o?=
 =?us-ascii?Q?3S0d6YsEod3kKGiC6U/RF1vVBLIMC56ic6SgiiBE8UWkkC264ZChN+UkXSxT?=
 =?us-ascii?Q?u+GEgatMmWLvtlPHap7zIPxyi5pCL0/ZgKuyhAKJ+aRJxgUkeAzgaP+AILb2?=
 =?us-ascii?Q?McH6AiUSs7CY5PFadMcjzAN4slKT?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?YDON+dVDfZtjsgm/GzvFsAQB478hPjKj2LX3cYw1eN0sR5Jlu5/sI8GUWP+I?=
 =?us-ascii?Q?lIRETRXq106xdF52zjtEmAkuFqXRax26mE/dnYvmTz6dQcr/NZtVf0fiiuvp?=
 =?us-ascii?Q?vdMFWDcexIjnNKXdcnSaItYAKXCnxho5AbmRiLG0z88U0AqixN6Tg7XdpESI?=
 =?us-ascii?Q?bl10ddHWQTcsYabzDWVDxm8G1gTrHZ8rgtBqBzaNXfrI+ZpVGPhDwbbglyk4?=
 =?us-ascii?Q?0t4MHJeISuhY/j13iMr+ZxZ6FG9zeKj3Y3Jvt5nyi0PVb5rOpUc//MiSlvPN?=
 =?us-ascii?Q?aZNwwVBVJXu0mgfQT0pYponazBUPZ8dZKpszsrt0DxpQV/vxsO8ohWq1KViJ?=
 =?us-ascii?Q?iPdNTxvQKPyUYTkI0P02Ouqbo0BHZ17KFTo6gQB5PUH1Y6scnFN/dMsZedLc?=
 =?us-ascii?Q?WIgYE1vaUhyvd9yjB9xKRJRwNgcpXCy6FXdEbghe2Jrjckod6DX2n9gpdZSn?=
 =?us-ascii?Q?cx1xltt5IV7eBWDjebJR0svDF7qTDHbkL+CVEpP7mcI9avSM+lpoMl2+K4tZ?=
 =?us-ascii?Q?VFY3aAYqfKOo57gIvWDN0RMUmoHHOyMzHEjy4sWPFVXXEPtw0qKAbFIFClbW?=
 =?us-ascii?Q?8DJPjFQEg/VWM6VCF2S4bn68IowJnynPo4GvJoewh9Rz5Kjm70pwZf1b+B/p?=
 =?us-ascii?Q?f6Kbr4HBsoALKCM7N0B6A2B7vc+8hay5MLlV46WkftysKu87e5i/Xo5yT/am?=
 =?us-ascii?Q?35zR5DVK1PP/ARHRIDdJ/qBT9FCSNs3CNu/nMvt41djqY2REvfyDw0is165Z?=
 =?us-ascii?Q?4EC/Q/j8OJKCDJybkYVzizE+NOhWUORAO4JtOnYATRGUrlFuRSd7mU9dkM2q?=
 =?us-ascii?Q?iDQZwZdpbBJjpa10aqZATjqT9VGY/LVzfqyY57uv9ViaQMV8pb1td/Qz+s3C?=
 =?us-ascii?Q?MW2CjDY5c/xpVdB3qJnH7UV/PvyWvGcli1aoYE2G1B1qPR/2Jc7lRFGJmZNQ?=
 =?us-ascii?Q?btifwVPKOSgPGMbmkW0Hh0X5UXPYjZbTZOoY8l0a20/PzYRt1Ph1OEpWxkSE?=
 =?us-ascii?Q?fF3PpT3eKc6+VnuOzB007zQVBplB0PoShkTVdap7Fg7KFstvVl+ffwOJ+yb3?=
 =?us-ascii?Q?38J96c1/BGXWJqSjXUWxk/xAyXcDErDr845Dp0FcAu05NN7SZ/nzMDlOD2qh?=
 =?us-ascii?Q?Y8A5SWh14uV6BbrVadMLMfMeHkbclcTVCLeZy4gE++PMt7NDJlMOwMtQKewu?=
 =?us-ascii?Q?LRL7jm9ynGkiI7xpeLAwcKwi9K3KcSxEW3qfl5d2n4l/ceB9lZtjC0CGkXbr?=
 =?us-ascii?Q?/wkaU5AwM6xS0+p4v931yOjFi209lk87LIpC2t+0RxEh7UHyffFpSve9jxXx?=
 =?us-ascii?Q?CT3pDRBjZL6eKq+31K1HI2pI9XIOtn6aTYN/iQiWSLdvq4HHCmyAEVKRhd5L?=
 =?us-ascii?Q?gD2ZH3Wow5W61ytf4paFYiVqE7ul2VLiAcoS0DW1SnKB9MrDC5mFEzvw0tD6?=
 =?us-ascii?Q?ZfJL/m1h264HIgvHCk2u68AsRjpdmlBiSQd1IYEdc3jv0pqcJJMRRNKU5G9L?=
 =?us-ascii?Q?bxs4gicVJfjuVzFxCI8CdkruYW6xDNLgJPz0MptvImQPueM9NNx3CNRHhVwS?=
 =?us-ascii?Q?90bX8BXyD4ycFsxYUV8=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d0ae9a-2771-4c17-c22e-08dcc26ff2e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 06:02:05.1715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ui03DEGkk10091hl10sUHMhJkJoJcUeZR2UXGKu2WahtfbI5qGEjirHOHXqf4SZujRkJnA+7XUrWHGAke+r8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8783

Hi Sudeep,

> Subject: RE: [PATCH v7 0/7] firmware: support i.MX95 SCMI BBM/MISC
> Extension

With Cristian's transport patchset applied, there a minor conflict in Makef=
ile
with this patchset. Please let me know if I need to send v8 to address
the Makefile conflict or you could help.

Thanks,
Peng.

>=20
> Hi Sudeep,
>=20
> > Subject: [PATCH v7 0/7] firmware: support i.MX95 SCMI BBM/MISC
> > Extension
>=20
> Would you please give a look on patch [1-4]/7?
> Cristian has gave his R-b, are the patches good for you to pick up?
>=20
> Thanks,
> Peng.
>=20
> >
> > i.MX95 System Manager Firmware source:
> >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> gith
> > ub.com%2Fnxp-
> &data=3D05%7C02%7Cpeng.fan%40nxp.com%7C1002bc37426b4344192
> 5
> >
> 08dcbde5c496%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%
> 7C638594041757
> >
> 286225%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ
> QIjoiV2luMzIiLCJ
> >
> BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DId8fggn%2
> B%2B8NBRYzEHSr
> > LK3GYSDX8bA3%2FNHPibH5xuEk%3D&reserved=3D0
> > imx/imx-sm To generate html from the repo: make html
> >
> > i.MX95 System Manager Firmware support vendor extension
> protocol:
> > - Battery Backed Module(BBM) Protocol
> >   This protocol is intended provide access to the battery-backed
> module.
> >   This contains persistent storage (GPR), an RTC, and the ON/OFF
> > button.
> >   The protocol can also provide access to similar functions
> > implemented via
> >   external board components. The BBM protocol provides functions to:
> >
> >   - Describe the protocol version.
> >   - Discover implementation attributes.
> >   - Read/write GPR
> >   - Discover the RTCs available in the system.
> >   - Read/write the RTC time in seconds and ticks
> >   - Set an alarm (per LM) in seconds
> >   - Get notifications on RTC update, alarm, or rollover.
> >   - Get notification on ON/OFF button activity.
> >
> > - MISC Protocol for misc settings
> >   This includes controls that are misc settings/actions that must be
> >   exposed from the SM to agents. They are device specific and are
> > usually
> >   define to access bit fields in various mix block control modules,
> >   IOMUX_GPR, and other GPR/CSR owned by the SM.
> >   This protocol supports the following functions:
> >
> >   - Describe the protocol version.
> >   - Discover implementation attributes.
> >   - Set/Get a control.
> >   - Initiate an action on a control.
> >   - Obtain platform (i.e. SM) build information.
> >   - Obtain ROM passover data.
> >   - Read boot/shutdown/reset information for the LM or the system.
> >
> > This patchset is to support the two protocols and users that use the
> > protocols. The upper protocol infomation is also included in patch 1
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >
> > Changes in v7:
> > - Just correct R-b tag from Rob to drop quotes "", and rebased
> > - Link to v6:
> >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> lore
> > .kernel.org%2Fr%2F20240718-imx95-bbm-misc-v2-
> &data=3D05%7C02%7Cpeng.fan%
> >
> 40nxp.com%7C1002bc37426b4344192508dcbde5c496%7C686ea1d3
> bc2b4c6fa92cd99
> >
> c5c301635%7C0%7C0%7C638594041757299262%7CUnknown%7CT
> WFpbGZsb3d8eyJWIjo
> >
> iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D
> %7C0%7C%7C%
> >
> 7C&sdata=3DIelY7nn8UonmziY%2FTKQy0V5F68zDmX3fRJeS%2FNYxlRA%
> 3D&reserved=3D0
> > v6-0-18f008e16e9d@nxp.com
> >
> > Changes in v6:
> > - Add R-b from Cristian for patch 2,3,4,5,6
> > - Add a new function parameter 'bool enable' to rtc_alarm_set in
> patch
> > 2
> > - Drop dev_err per RTC maintainer, move devm_rtc_register to
> function
> >   end in patch 6
> > - Address Cristian's comment to documentation. Also moved the
> >   documentation to patch 3, which adds the imx.rst under
> >   drivers/firmware/arm_scmi/imx
> > - Add remove hook to cancel_delayed_work_sync in patch 7
> > - Link to v5:
> >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> lore
> > .kernel.org%2Fr%2F20240621-imx95-bbm-misc-v2-
> &data=3D05%7C02%7Cpeng.fan%
> >
> 40nxp.com%7C1002bc37426b4344192508dcbde5c496%7C686ea1d3
> bc2b4c6fa92cd99
> >
> c5c301635%7C0%7C0%7C638594041757307547%7CUnknown%7CT
> WFpbGZsb3d8eyJWIjo
> >
> iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D
> %7C0%7C%7C%
> >
> 7C&sdata=3DTIgALwKaM0bL3%2F8%2BH5TURHjK4KM6Qadpr64dUEbla6
> M%3D&reserved=3D0
> > v5-0-b85a6bf778cb@nxp.com
> >
> > Changes in v5:
> > - Collected missing comments in v1, I not intend to miss any, and
> sorry
> >   if I make something wrong.
> > - Update the documentation per Cristian's comments. Not sure we
> need a
> > new directory for firmware stuff, not firmware-guide direcotyr.
> > - Added R-b for patch 3 "firmware: arm_scmi: add initial support for
> > i.MX BBM protocol"
> > - For patch 4, added comments in scmi_imx_misc_ctrl_validate_id,
> use
> >   num_sources in scmi_protocol_events, move
> > scmi_imx_misc_protocol_init
> >   near init, use get_max_msg_size and drop MISC_MAX_VAL.
> > - Separate the sm-bbm.c into rtc and key drivers with
> >   each has its own notifiy callback, put the driver in rtc and input
> >   directory, handle error return, add kconfig for each driver, use
> >   to_delayed_work, use READ/WRITE_ONCE, still keep ops as private,
> >   device_init_wakeup set false if failure.
> > - For patch 5, Add kconfig for sm-misc.c. Only support one instance,
> > so add a check
> >   ops in probe.
> > - Link to v4:
> >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> lore
> > .kernel.org%2Fr%2F20240524-imx95-bbm-misc-v2-
> &data=3D05%7C02%7Cpeng.fan%
> >
> 40nxp.com%7C1002bc37426b4344192508dcbde5c496%7C686ea1d3
> bc2b4c6fa92cd99
> >
> c5c301635%7C0%7C0%7C638594041757313869%7CUnknown%7CT
> WFpbGZsb3d8eyJWIjo
> >
> iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D
> %7C0%7C%7C%
> >
> 7C&sdata=3DNLUX8pWiyfLJXd9tLkWZHW9HxB00gVnKpNqGphH6PZk%3
> D&reserved=3D0
> > v4-0-dc456995d590@nxp.com
> >
> > Changes in v4:
> > - Rebased to next-20240520
> > - Added vendor/sub-vendor, currently the sub-vendor is "i.MX95 EVK",
> >   this may not be proper, I will check with firmware owner on this to
> >   seen any update. please still help review other parts of the patchset=
.
> > - Added constrain value in binding doc, change the property name
> from
> >   nxp,wakeup-sources to nxp,ctrl-ids to match firmware definition.
> > - Put i.MX code under new directory imx/
> > - Change the misc event from three to one, the code in previous
> > patchset
> >   was wrong.
> > - Link to v3:
> >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> lore
> > .kernel.org%2Fr%2F20240412-imx95-bbm-misc-v2-
> &data=3D05%7C02%7Cpeng.fan%
> >
> 40nxp.com%7C1002bc37426b4344192508dcbde5c496%7C686ea1d3
> bc2b4c6fa92cd99
> >
> c5c301635%7C0%7C0%7C638594041757319735%7CUnknown%7CT
> WFpbGZsb3d8eyJWIjo
> >
> iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D
> %7C0%7C%7C%
> >
> 7C&sdata=3DDsX6rHSn9UHxg00XUXdioRTDKikM9dlGWtyMOWSKQqc%3
> D&reserved=3D0
> > v3-0-4380a4070980@nxp.com
> >
> > Changes in v3:
> > - Update cover letter and patch commit log to include more
> > information.
> > - Add documentation for BBM and MISC protocols under
> >   Documentation/firmware-guide/nxp. Not sure if this is a good place.
> > - Fix the bindings, hope I have addressed the issues.
> >   Drop imx,scmi.yaml.
> >   Add nxp,imx95-scmi.yaml for NXP vendor protocol properties.
> >   Add constraints, add nxp prefix for NXP vendor properties.
> >   Use anyOf in arm,scmi.yaml to ref vendor yaml.
> > - Use cpu_to_le32 per Cristian
> > - Link to v2:
> >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> lore
> > .kernel.org%2Fr%2F20240405-imx95-bbm-misc-v2-
> &data=3D05%7C02%7Cpeng.fan%
> >
> 40nxp.com%7C1002bc37426b4344192508dcbde5c496%7C686ea1d3
> bc2b4c6fa92cd99
> >
> c5c301635%7C0%7C0%7C638594041757325573%7CUnknown%7CT
> WFpbGZsb3d8eyJWIjo
> >
> iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D
> %7C0%7C%7C%
> >
> 7C&sdata=3DxCKP6hjdqJIppJkmJsNhfZa85df%2BDYR%2B%2FawL6qQI5Xc
> %3D&reserved
> > =3D0
> > v2-0-9fc9186856c2@nxp.com
> >
> > Changes in v2:
> > - Sorry for late update since v1.
> > - Add a new patch 1
> > - Address imx,scmi.yaml issues
> > - Address comments for imx-sm-bbm.c and imx-sm-misc.c
> > - I not add vendor id since related patches not landed in linux-next.
> > - Link to v1:
> >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> lore
> > .kernel.org%2Fr%2F20240202-imx95-bbm-misc-v1-0-
> &data=3D05%7C02%7Cpeng.fa
> >
> n%40nxp.com%7C1002bc37426b4344192508dcbde5c496%7C686ea1
> d3bc2b4c6fa92cd
> >
> 99c5c301635%7C0%7C0%7C638594041757331366%7CUnknown%7C
> TWFpbGZsb3d8eyJWI
> >
> joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3
> D%7C0%7C%7
> >
> C%7C&sdata=3DV5SX0eUuQo5nYcQD44C%2FSnq9M9cc2TlpeuoO2A2Mh
> Ss%3D&reserved=3D0
> > 3cb743020933@nxp.com
> >
> > ---
> > Peng Fan (7):
> >       dt-bindings: firmware: add i.MX95 SCMI Extension protocol
> >       firmware: arm_scmi: add initial support for i.MX BBM protocol
> >       firmware: arm_scmi: add initial support for i.MX MISC protocol
> >       firmware: arm_scmi: add NXP i.MX95 SCMI documentation
> >       firmware: imx: add i.MX95 MISC driver
> >       rtc: support i.MX95 BBM RTC
> >       input: keyboard: support i.MX95 BBM module
> >
> >  .../devicetree/bindings/firmware/arm,scmi.yaml     |   5 +-
> >  .../bindings/firmware/nxp,imx95-scmi.yaml          |  43 +
> >  drivers/firmware/arm_scmi/Kconfig                  |   2 +
> >  drivers/firmware/arm_scmi/Makefile                 |   1 +
> >  drivers/firmware/arm_scmi/imx/Kconfig              |  23 +
> >  drivers/firmware/arm_scmi/imx/Makefile             |   3 +
> >  drivers/firmware/arm_scmi/imx/imx-sm-bbm.c         | 379
> +++++++++
> >  drivers/firmware/arm_scmi/imx/imx-sm-misc.c        | 315 ++++++++
> >  drivers/firmware/arm_scmi/imx/imx95.rst            | 886
> > +++++++++++++++++++++
> >  drivers/firmware/imx/Kconfig                       |  11 +
> >  drivers/firmware/imx/Makefile                      |   1 +
> >  drivers/firmware/imx/sm-misc.c                     | 119 +++
> >  drivers/input/keyboard/Kconfig                     |  11 +
> >  drivers/input/keyboard/Makefile                    |   1 +
> >  drivers/input/keyboard/imx-sm-bbm-key.c            | 236 ++++++
> >  drivers/rtc/Kconfig                                |   8 +
> >  drivers/rtc/Makefile                               |   1 +
> >  drivers/rtc/rtc-imx-sm-bbm.c                       | 162 ++++
> >  include/linux/firmware/imx/sm.h                    |  33 +
> >  include/linux/scmi_imx_protocol.h                  |  59 ++
> >  20 files changed, 2298 insertions(+), 1 deletion(-)
> > ---
> > base-commit: 668d33c9ff922c4590c58754ab064aaf53c387dd
> > change-id: 20240405-imx95-bbm-misc-v2-b5e9d24adc42
> >
> > Best regards,
> > --
> > Peng Fan <peng.fan@nxp.com>


