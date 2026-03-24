Return-Path: <linux-rtc+bounces-6244-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEShOHywwmmRkwQAu9opvQ
	(envelope-from <linux-rtc+bounces-6244-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Mar 2026 16:40:44 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A83D53183C9
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Mar 2026 16:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DBE933087C02
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Mar 2026 15:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6278640626B;
	Tue, 24 Mar 2026 15:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="S+7FCgzk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013059.outbound.protection.outlook.com [40.107.162.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B65406263;
	Tue, 24 Mar 2026 15:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774365995; cv=fail; b=gOkJtXJ06h1fU9Sw1ECQTKkF503H/nKHKedfd+agnPdd2/panNVClGexWF2l2JCL3uz095Lj3Dgmdjb5SdQrJiVOy4NCLkwxXHGDOwnK3o75s5Mg0riEcoMOn7fuh08jLjdUkAaUsYGhpce5M9jUhT29DrlhFD6L+yFWHjKUlnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774365995; c=relaxed/simple;
	bh=aOIgdpzO1Gkfl+H6jqO9XstFjZVbGdGgvNj1ucVpTDo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nSwGUM6Y+Sb0LMgP29ny8+n7oc9EAwNmS24GsgYu6Jbn42zhNYTIeT6RWgXDfUcJpfoMYyb5iQbGvWysRnuI0XaKDLL+Pmdl0bPZiDOJHtNzk+QfAyk+W80b0Hz5UWXLgjDES3ePgxNOHw55RQKwVluCplt4T0Vt/yZYOMBCfcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=S+7FCgzk; arc=fail smtp.client-ip=40.107.162.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WEJztNiA1JPtGDXEbTnvXeZuLsJV3pN2n0B0CQMZATOcYP+LfXomsZrpYvlDGEOoxaK8IU9PjYltc0ONXvNaLpLCNO2ezImq1Evymvz1zp3+wnZ/4gjs9ub4HdTqGbcMcDnEQIC0gECp0zDxgD4u37QkrGV2yRqsjQL4M3V+186skeU/YEDdxVfOFREFLNBIM2ZY7gQQJHokMhIZeTCSF8kXtJBfj0dFE9HUcxiHzfaUOUEY2NhLqUkfj2Tw3zmHwBE4ZikTwhgVhAq0kr/HAsjkq/8C33x9iW3sDAxJUGbKWH4FnMFJ/JHUI9IGq0fvq0gcRYVpBSW2G71DzKOrpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ge2/jlpb8eTskJ0sXnAQkb3whHXyg0xtFIymILGwcX4=;
 b=Dp38sfAWrq9Wtyp68xkZLVMVVu31iiVdB/QtnBU3XsSrZtjCDQ1mJ2cqozb0CnE2pSozfCOX1OvlEvpE7MnLTnwPMyDUPiv5cD7iLS5PVOgZNF6ZIkEZlkW+qLkwt6ZYLYqOuVUz33FdMAD8Ir6EnSDftIb00yyc1abC5uO0M93R1/nTaN8pBqOnpH2btAZEe9VY50GVNcA6NaRoAs7j2ZEY/G4njPliujsyHHoLGyh7gK5rbSXvq1o7LxhxcNTJ6FeCtldgBVH0Gxc6edNyBi3LgIkCtXU6Yuh6yWXpmC4JxyR9t9icBaiXvn5yLETMeNC+UXWxYrz5ZqDv/X6D/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ge2/jlpb8eTskJ0sXnAQkb3whHXyg0xtFIymILGwcX4=;
 b=S+7FCgzkvjmiLPi4TfrkX5uew3PcHlIeYCGpYnbpCms3eTl45V1tXvgd/GWsnMpUoZG4qKo4+NR3WOA/0XZEKvCkKRS+qziKY8ns58WpnsaHiqJX1N+eVYsp27gFdA9YA3rwK85/wJYAKpVKrEmVEa4SobSHm4207JVmfXUy2wTYLCLBtYuuimQYmOXcX9ombF77mFRz6SaUqc+xfaPUSHKDeodHmyjUuLPX3LWbh3OfJ4A7MsoVOyHWbWDHF5yuNtQWaGhMjvbJY7GJYB5zesrFV1pQWbBz5BR0VQe/K/8MGiZMiX/7nbiklwTSYo2E84+QK8bJuoP0ZDCApoIkJA==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by PAXPR04MB9325.eurprd04.prod.outlook.com (2603:10a6:102:2b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Tue, 24 Mar
 2026 15:26:15 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.20.9723.022; Tue, 24 Mar 2026
 15:26:18 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux@roeck-us.net"
	<linux@roeck-us.net>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>
CC: Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>
Subject: RE: [PATCH v4 1/5] dt-bindings: rtc: nxp,pcf85363: add timestamp mode
 config
Thread-Topic: [PATCH v4 1/5] dt-bindings: rtc: nxp,pcf85363: add timestamp
 mode config
Thread-Index: AQHcWuAAR8BPN5MBkUWbSOAo/I/sE7W+jxgw
Date: Tue, 24 Mar 2026 15:26:18 +0000
Message-ID:
 <AS4PR04MB93627848DDA9C7D80B3ABC23FB48A@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20251121121137.3043764-1-lakshay.piplani@nxp.com>
In-Reply-To: <20251121121137.3043764-1-lakshay.piplani@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|PAXPR04MB9325:EE_
x-ms-office365-filtering-correlation-id: 38695eae-0787-4851-c8de-08de89b9b22d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|366016|921020|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 GvyPSOC2Cx1tSQ8Lu7kM8RUovCzClUkccz1diPhY9AvEOm89OH1W1ZRoNfw4yUAeABrqCQ32YLfotvE2QpUWz3xgd36xIMqXuIDC364/XqICfWTkGFGYZhSeiAEUniR045+WBsxiId2Y1MYywuu42rR/Y2UzirtorzLlyFJ5GAww9Ge+Z/f7L+aQ4CFiqng98XBeheSU84lLjZ1ZO9yXo2Bmk8AECWHOJkL8Mg42hRM2XIm6IXaZlJx6gO+fDeQA5og26bfG1V0CEOegLdem/iuco6npzR61CKEpQPBQE8aUscF6/3RaILnTwAcmB41F+ChYF0V0dqLWzAVl9u5QtYBuHxt3dPvKMEEJ0Ah6QfrE3JiD075q9ni95KJsYDCB/p4/xEBQuEqAOsEybuNm17C+9mkvqg9wzpyWqSAC5COkmNG5SiQ3qSGAY6vgVc+upVUAG2+fum2B8A9g8dz2gFLVR0GEKR7Nm0dNrKynu8o+2aHVo5E5QJPUHu3fmgfDmda5O92RASTEkum4kcQFLLjPRFEkCNRBIoR6Jq+NR/iv3m54LH2FtDklJSxOdCMgn7tb11QMT4XftSCZrRQOwwMAqgL5kHLaVw1T8r6DOdq2dUkTzVCraP8/M68FMAsMhp/39aVnZ/F99ab3SHrmxeX725pm36lfbqhEuruGNYQ+kGxX4emsh+bqOYhDubq9Z2AVg5cuVLKFbAg7cvWiDYnXDgp0qGhgVwzu9VYlgGKtRPaRdg85LfE9UKvcrb3pFgB43ZJgR/aEO0ZUJSLOBabNcFy7Xc8bQc7qzPkvTXC19jO+/YGRi3yu+KVrJ2nr
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(366016)(921020)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MXrFgZUZfCfHgK8y3ioxQb+XmLg7gsPvVYv8qkHdaBqc5ppMkC0Pht92loSq?=
 =?us-ascii?Q?cQm1TvQn4AD6UTr2xK0EkpoVzsuLiCWzo9c7ab8P0XKlUJ6oaSdvCnln8yJl?=
 =?us-ascii?Q?Gss7d5bhz5mrbn8BpcEg/h8GZ3YNS8ny2N7qvkKyiJuzvD6VBF4R0r+4Z/Gt?=
 =?us-ascii?Q?jaZdw8nr0OyqfnpHKZeomqX/CQvZ5rKZPNmMWbProMOK2PUVf71JUipzz3c3?=
 =?us-ascii?Q?vHvGtzlsIDqHcRt5Kr1EPdw9bo9i9otybR16vTb2sxdevvoom3SaS8xP5ViL?=
 =?us-ascii?Q?ta2LAzy2rbWSvuT5vXF1W7knGHRpG6OD4DvbNIWToxhf9pvPm1wGuB9/ARa4?=
 =?us-ascii?Q?sjgvirH92oL9jugPmDjs4q6WeQzmcAkScyWUJlQv/6b7E7ld2J1nJx6k0DeF?=
 =?us-ascii?Q?mLj3v3wo0RJmBRp6FWGQyILmahxgqvJk4rvYnS1bAMzxfxfCw3yCdCS3i89B?=
 =?us-ascii?Q?Qc/5lHdoDhI16A2pSmOrI6PLUkWmlPZip6t4dTH4mox2DV3lf9BhEkOLjqm7?=
 =?us-ascii?Q?imSUjVXsXKRyc4asriP6ND/vHyUZJvAAXhhZ4zL0LTZiXhco/Y/vxWYStoiE?=
 =?us-ascii?Q?JIiSaNSsGvAt5AU3+tTdWsk/pnrQ0XMHOZQrtEiARwfB4Np0ZVZYULze2fue?=
 =?us-ascii?Q?l0GuaL6tx8OLIPJLANB7AIBfzpMzo5z9cHi/nUNJtR/jX8cV1/eOQ9D1ZSIB?=
 =?us-ascii?Q?5fV/3vkrBsmBpK8i/T5vTJMkOm7O6Ym1EvspVMP9ggeviQLEThOAXDtfsO8t?=
 =?us-ascii?Q?K5uYnCBt8XedZjxJbvJD1N3tNv2ON8NBybCLHtDnPSKydaAWN7R6xZz/qwUB?=
 =?us-ascii?Q?eYsjdtAYVjhvWeZe3ewPneB/pHqTQ7G0lXdrd7veZHJdz4//ZjfIRsG5HFYB?=
 =?us-ascii?Q?Wi1mpflnkXXA+9LpQH1SY9Sov051QiVfksqpvCcyqf9CSHrep6lZ0RkvO3RE?=
 =?us-ascii?Q?URxygnM4qjNifrCUJF799Sw1XT/wfbPv9D9hUOUD5xuMT8zyIay/5kHdmTnK?=
 =?us-ascii?Q?ZnUMdu/u8H7w5YyQdcHT8Si7t8YqsILlImeFBtaKqe96ZJceDuyeRmZup6sp?=
 =?us-ascii?Q?H+nPImolupRRxeYXu4GRPVVDOCh3PXY7ZkM81cwZTCcJ3z1cP22ruDvLke3q?=
 =?us-ascii?Q?kkRuCo5kgSZa2wX26Kt7466ghWXx8AGDGt9B7a0t9Ma88StjnW9TkwDxGvz7?=
 =?us-ascii?Q?5ILJYZE5kYxq8rsoXMDIv7y/5hg3kVzMx37czQ65lvglFF5L8M7S25AWVx29?=
 =?us-ascii?Q?KF7ASdRfO3lTswbdxPxbAamSti04CTEDcschSMM69ExXniYhEyZPZst53kp6?=
 =?us-ascii?Q?YhedDhDqtge1Ixb3XIrOUPskjQNPNFeZa2cNsWpffFKJ3mXjYyStZPne8iV5?=
 =?us-ascii?Q?k/HlI91AsQwYHMldPhwR18xGFJOnjJ1q88ZKwRhPehCamuAdT5pBycLagCkc?=
 =?us-ascii?Q?YdpeMWlsynCGn58/vO9mBHILUNGYjc0FaOs7MoNna1zZUyvBylsPHSxd38i3?=
 =?us-ascii?Q?iJc4xx9p3cLVISxuBF3qj8GzkQfte18fWJwNpzx3ZcVzEvKep+yokgWtjOMt?=
 =?us-ascii?Q?46eya3GDzQhzL+W5SJH2vYLq3HfMxQPsAgec9Wxf+6NxixQTY5JYqwy1dFSi?=
 =?us-ascii?Q?fyoWldIgoLn8pcPsuxSB8KFAA2IoNo+sgxm+AJHV5d6O88aFqhtlUkKIwpaq?=
 =?us-ascii?Q?Olr+m3GPna1D25/TzpWwAVecCKlevK6SPN4AfshCTeqDF4rzwbOCuZw0S+sU?=
 =?us-ascii?Q?9j9GTZtLww=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9362.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38695eae-0787-4851-c8de-08de89b9b22d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 15:26:18.3936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9acHl+tkA2t74N4464hI2RH/0Ixy5v6i+MjThxIPr+otvcg6nUVn/fHC6AK+Hg5Pr9XULt93h5i0vJz6KY2l3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9325
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6244-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lakshay.piplani@nxp.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[AS4PR04MB9362.eurprd04.prod.outlook.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp.com:dkim]
X-Rspamd-Queue-Id: A83D53183C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> +    #include <dt-bindings/rtc/pcf85363-tsr.h>
>      i2c {
>          #address-cells =3D <1>;
>          #size-cells =3D <0>;
> @@ -56,5 +75,7 @@ examples:
>              reg =3D <0x51>;
>              #clock-cells =3D <0>;
>              quartz-load-femtofarads =3D <12500>;
> +            wakeup-source;
> +            nxp,timestamp-mode =3D <PCF85363_TSR1_FE PCF85363_TSR2_LB
> + PCF85363_TSR3_LV>;
>          };
>      };
> diff --git a/include/dt-bindings/rtc/pcf85363-tsr.h b/include/dt-
> bindings/rtc/pcf85363-tsr.h
> new file mode 100644
> index 000000000000..1fb5b9b3601e
> --- /dev/null
> +++ b/include/dt-bindings/rtc/pcf85363-tsr.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#ifndef _DT_BINDINGS_RTC_PCF85363_TSR_H #define
> +_DT_BINDINGS_RTC_PCF85363_TSR_H
> +
> +/* TSR1 modes */
> +#define PCF85363_TSR1_NONE 0x00
> +#define PCF85363_TSR1_FE 0x01
> +#define PCF85363_TSR1_LE 0x02
> +
> +/* TSR2 modes */
> +#define PCF85363_TSR2_NONE 0x00
> +#define PCF85363_TSR2_FB 0x01
> +#define PCF85363_TSR2_LB 0x02
> +#define PCF85363_TSR2_LV 0x03
> +#define PCF85363_TSR2_FE 0x04
> +#define PCF85363_TSR2_LE 0x05
> +
> +/* TSR3 modes */
> +#define PCF85363_TSR3_NONE 0x00
> +#define PCF85363_TSR3_FB 0x01
> +#define PCF85363_TSR3_LB 0x02
> +#define PCF85363_TSR3_LV 0x03
> +
> +#endif /* _DT_BINDINGS_RTC_PCF85363_TSR_H */
> --
> 2.25.1


Hi,

This is a gentle reminder regarding the patches I submitted in November.=20
I haven't seen any review feedback yet, so I'd appreciate it if you could t=
ake a=20
look whenever time permits.

Best regards,
Lakshay

