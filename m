Return-Path: <linux-rtc+bounces-3967-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0390A8B169
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Apr 2025 08:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C34019040AF
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Apr 2025 06:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8265E22B8C3;
	Wed, 16 Apr 2025 06:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XvxdneRT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2063.outbound.protection.outlook.com [40.107.103.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C2822B8AF;
	Wed, 16 Apr 2025 06:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744786662; cv=fail; b=CaxLDu8aOMOhBrDblBkdQ6FVfNy5K1JRVsv/9NwKz4uZUbXlnHRRBejVGcrBfGEmfYEFouOOb4xjZHofziRdv6a43DubMpyyp8/CQbOsW36hh4BvJ1KfJ8ZVQUH2aPXG4cJrU7a0x7Byl0yx4avv2PY9U8d63NY1Ro6Tmc0d8kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744786662; c=relaxed/simple;
	bh=3+YfvC4bO20gt/kY4EU3xzmkfIXmbVNkP8TsP4s+Djw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EZ5g+5hZysYz/GGy3QJPbRonr1jrJxWuDJ8H+7UfdYnliHRIJ2iscSBOPSmNa+z46e8NYUqsx50Dw7ZN2mpqP5t6I6Wc95C92M6uM/zBjttGkK9OxsC5aVZyqtGgJ8iwy3n/ufehoVzptd05a+zPgfoPsr+kFdq+MXGRJB+0EhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XvxdneRT; arc=fail smtp.client-ip=40.107.103.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2vI9rJz5jQf5fAOBxWGfnKH2WzgJqdjXKXFPm7tbUTjCfWkjQ6Iy3MmG053gI/Vkf2GURKqQrhTR3OCmfR7+y1OFgPflmMelq2rtINTT2KDeX/0zB7mlVdogtBeILA5fXVR12FgNV7voNJl5tXaAikOmdGDufyOqgNyA0zMZhMWRK+s02OE8deri2pnxqW98NLfFrWaZOhhC5725wzZCOuyH4j71MVh+gF65CbIzoZLtV/7UfUjwJ1t1oANOoVXNxevWi0a2Sps05musxNx40DcxC1t3FtU6P97Bj1VzunkXkYWT5Sq/R3wEx7Un55kYpLJclQ/yA3NBQnnZS6pwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GruC462mlBpYM+yn+5hqMvU1FpGowMEkMPkvPS1s6ho=;
 b=qdEIvF+DfwLJO0/aNyA27LkYmh8criVjTv3NWq7GPGU64Hm+o3yyj8TEhadwdsQjvN8ulgsZPbjPp4hoKDkXJVmTvohU0hx22SDxeB4/JmwDGSFSdaGX8Uyb1rBju87zUxA+KQqTBC7uwpGd5EQYX4NOCH7OdVt3dD0T+djxSnaJv6DhDVTiRgRxRAFyQObfmgrckSAI063dvP5FAuN2zVMt7fNOa9fBZAXnZxceUJ+DFxvKgICSa2jPr03Fm0cUqGqLD9cjzZAV0OvFuBZfv7Rf8KqYj3LoLK+Pgz/T9+tq+0zDmJSbTusE+RFZek3cprEcaBCkMdGEEPSqfXJJSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GruC462mlBpYM+yn+5hqMvU1FpGowMEkMPkvPS1s6ho=;
 b=XvxdneRTHRS1LXL9zQjmLFthLuhiiwOe+kd3O9DNQgn6oCedEiGgWfcEyzH6c0yVITEUilKNnPsl5/FlQGXLsAY6od0s1NYJJhIKQH4+ecFDrvv98XqIGiVGeFFrfmbfyth1ZfJZ1eGYMndPq/zicO9v/MHFihNt64xgM07EU74iP7L7Yx0xBJj751eIz1TJIaIgggwXZ2e4Lb2LUoimNqwT8pOly1MgjmuC8xkKM6L/cCAjIubKZWbDCFxqYBBNDR6dZtoICPPIktGOwBN5l3+VKi2J+FjnHn2vehGX1vlcDzsh6Jw386KwbZ60l3YZ8T2pEPv4ovW0daSOBR3Otg==
Received: from AM0PR04MB6515.eurprd04.prod.outlook.com (2603:10a6:208:16f::10)
 by AM0PR04MB7121.eurprd04.prod.outlook.com (2603:10a6:208:19a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 06:57:36 +0000
Received: from AM0PR04MB6515.eurprd04.prod.outlook.com
 ([fe80::ca11:63b8:aeea:8043]) by AM0PR04MB6515.eurprd04.prod.outlook.com
 ([fe80::ca11:63b8:aeea:8043%5]) with mapi id 15.20.8655.022; Wed, 16 Apr 2025
 06:57:36 +0000
From: Pankit Garg <pankit.garg@nxp.com>
To: Rob Herring <robh@kernel.org>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, Vikash Bansal <vikash.bansal@nxp.com>,
	Priyanka Jain <priyanka.jain@nxp.com>, Daniel Aguirre
	<daniel.aguirre@nxp.com>, Shashank Rebbapragada
	<shashank.rebbapragada@nxp.com>, Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: RE: [EXT] Re: [PATCH 1/2] dt-bindings: rtc: Add pcf85053a support
Thread-Topic: [EXT] Re: [PATCH 1/2] dt-bindings: rtc: Add pcf85053a support
Thread-Index: AQHbkYcYcfJUEHgQ+kiMkK7ahPUAsrNsVc8AgDm+1iA=
Date: Wed, 16 Apr 2025 06:57:36 +0000
Message-ID:
 <AM0PR04MB6515F315ABA8374DD864FCFDE7BD2@AM0PR04MB6515.eurprd04.prod.outlook.com>
References: <20250310063846.1867615-1-pankit.garg@nxp.com>
 <20250310130044.GA3891357-robh@kernel.org>
In-Reply-To: <20250310130044.GA3891357-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6515:EE_|AM0PR04MB7121:EE_
x-ms-office365-filtering-correlation-id: 39d74234-9fb6-4186-da8b-08dd7cb3f853
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|38070700018|13003099007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?vBo78EZLsDKD9yCRAux20RjQpRhmtV/FGX3Y0kKB4YA1nUYsSF3oX01AU/CQ?=
 =?us-ascii?Q?pH1LIxrBqPqRut1j6Qu8kmieEltGxYIHsfzJ8Va+RpcMZwmSM9a1LxNXPmDf?=
 =?us-ascii?Q?QSriQutyxAxK5JRQnOYMIPTGO8/hePxfddil8GUgOpS0xny6RmlWi3V24veb?=
 =?us-ascii?Q?ExTjtfSrPog7EvJT3KXILAzQJfBHTX14dUtEGdd2VXwwsSmnAlyqJXLw3/jh?=
 =?us-ascii?Q?E4iCAyIC0NkBbnYo6+e4eYvtsDiBIyeXjo/WgdlLGxeMxOh41ldYD6DKhl/k?=
 =?us-ascii?Q?NrAtOb3xskEr5Ca0XVT/f+lY7d0G8nXa2VbLVZv0pGjRoqPzI2Czm/8e0TwD?=
 =?us-ascii?Q?GgJqBXPCUp6Oujub0Baaxab3nfwr3S5JiVOCV0SvxOmzHbHv7+ED0il1Dhyk?=
 =?us-ascii?Q?+7KvanGPrljvQVSN/lFihmgb4k1nD4ffCKC/zQXyBCfE0gm2gedxqXvZIwr5?=
 =?us-ascii?Q?eH6DKzX7dxDxYl1x72iqW4OyjQBlNAqyzpJPHotNnemYaRCsSkDY/zuGH6uO?=
 =?us-ascii?Q?Y5evJXSMr5Y7J1E+2//bRj7d2hzdbi3X2jzpnccwSPhmBMh4YDsWj6IhVJZj?=
 =?us-ascii?Q?RZA9eQmwvP5/t12TINAcv3YtLLzNBWL89OI28f6BFBieCH42rnCzm9INVXR9?=
 =?us-ascii?Q?/SmBe1VLefw9ZHlBqgfo/Oav0TH6SL2H7wIPNibNJa3ORoTH7Anvpu7w3zXC?=
 =?us-ascii?Q?7m/0xFcBxb30wiou021+Iwrwxa0KG01lJGwNYGbT+NYLZt4KkAmmWs9vVaFS?=
 =?us-ascii?Q?dodkLkmbeGQqA8pDTpXSAwlE0U6RFvEUt2SMV4ZfMwGYxtZlpVq6mdnniCzr?=
 =?us-ascii?Q?r53PdVY16k8NC2KTKryEcl5xYgXM/LmBJUBiyCVu7QfPWvuF1buqTozUTnVC?=
 =?us-ascii?Q?0sWC0MPm92m3P9HCUsu9+XyNV+pM9wYoPP8TxVVIdzV9w1XFcBN7E+ojY8z/?=
 =?us-ascii?Q?7Hoy8tE4qB4Y/cnOc2qZh2fnPeIDByys19zmxvgzOToCKj2qXjir316kp+GY?=
 =?us-ascii?Q?7mXHP+FJkUgCPG/xfQ3C8kIkNBxyqGNDRW8DVxlpf6d8AfJzhiOTM4sXwA2h?=
 =?us-ascii?Q?Y6vVK/WwxUU1GPiyf0juzbt+vjczhpyMtpCRhfvt+r4GT693iOwK77hnba3S?=
 =?us-ascii?Q?x9rZEHzhykm3eSQ2ubuAWn/9KVddfSSxA7819ZRj8pXmWI49B5RYJh7rE0hI?=
 =?us-ascii?Q?/nkpEWlYoqtgp62ZpsjsfFObBwt9VHMPojPgLwmJ7tn2Kp0uskG0ZKe3kCZB?=
 =?us-ascii?Q?f5F2wEO6YjjgBIwWPxumtziXA6M+eAIp9OHBYxF29WoAEpWxgyGfhwWGT1qI?=
 =?us-ascii?Q?O2aPgqJpZ7pizLbatqLCvr7kzMove/xIxnVpuRyKbL9R1ZmYyTe8GQ6/Amfr?=
 =?us-ascii?Q?0ed086QwO9nXuw7njWm01ix/zLGBjJapI2j6suaipiOihlr0kKb796EpyonR?=
 =?us-ascii?Q?qH6UP/u0iX1FlMnJsiK7nbW7e6N+KO5M2d+nWL2tcbsGNj/1R/CeoQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6515.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Qgvac0VG6jRR2uiF/X2o0mZpEfaMk36Y1Q4u1b77PuOzh/9l913eTo87qqJj?=
 =?us-ascii?Q?iYynsq6Ucl1pqXO4zL5p3IZqMa8sfmGJFS1JW2diCvg6qH+/euHo3suTSnZI?=
 =?us-ascii?Q?Gy5kyoE0SwDzYkSTNKRpX4U3t+izHI4HGwvFawZ2ZHyzPSR/AqNg16DVjSMg?=
 =?us-ascii?Q?5xoh/Rf5f14CYY8k1eZOhH+TbBegURNJuFz5c9XkHjUwVFcc3nzrNQYqfn8s?=
 =?us-ascii?Q?iu63JvZCaWMwMOoUGEj0+kWIx+n5TN6175FARFPLqlSZFgrWbCkkioY4YKHZ?=
 =?us-ascii?Q?XFITv3Y+0mFnc9DymN28GoB5fTlTU4TxG3EXCVTzdfaUn83K8Pisr3jC/NMJ?=
 =?us-ascii?Q?u33h1cf2dLdk+AwGOp+dXb0I700d839vqTHTrKNm1Sz5Ot1f/KUfwHAKFb+u?=
 =?us-ascii?Q?4p8SMrbpqXxFMyuCaQ5o/Tl/xLAGOMx1kGmgui5KIViotI62tyFcSi3WqKZK?=
 =?us-ascii?Q?RMdEySYdaFk1FYhqc0j3MfQVAaAueCOdnPJrPHlblYu0dqNMtucO2Osz2lt+?=
 =?us-ascii?Q?+xmcBxawVCEiw0HxJdqHo4blHgb65MaTSZSIWcUw7qQYNhpBahU9NcmvG9bq?=
 =?us-ascii?Q?sw1bNYyiXFPQzWvnqKqh8L+pGltOYGb5rdzdmyqTYYoncn016nhZxX5kx0oL?=
 =?us-ascii?Q?a7HrVjG2LKe4YOkj5Kf6iDc5dAJYHA1GJRjNAyQRpygfLX1tgmw2ZSOwvXPg?=
 =?us-ascii?Q?mJXP8ifCYMSVn+tE9L8UP4zkdZbFKCWaLwgojUGJdZjjWsHNZWDOn6E1B0cd?=
 =?us-ascii?Q?37QotAeZKNsolTRuO8XF57d2ZGMOY2yzVudWIcrLloxltQ+Fz48hIG0KNAfh?=
 =?us-ascii?Q?3lvrvi2bqcjbxELAk/WX9PRcQ5mGMN7LO9rse3VJCAVblXODBgv15bCOYEC+?=
 =?us-ascii?Q?Q8VI3VVsWanGbyJercsSaQFIXVOjligjacM7y/LX61wZFYotCkIxe0NFALto?=
 =?us-ascii?Q?yZrC+2OdoGme0fzwF3zTCXXhXalQih2VvXrSJxzPNB/30ps4LDN/J6XvW9aY?=
 =?us-ascii?Q?8pwaZTBtlzao5IKNaBS0Qm4ID1a6w8NskGGOhTonceGY5VsUAc2Qv0kwUSiN?=
 =?us-ascii?Q?U+t1fZGXybYl/04L1Xk22vpo92Oy1mhc72U0GyDt4zQHbz4mvHoh6ekzneGI?=
 =?us-ascii?Q?AOUGz36EWCsXIU6+PS9ppI3aJjIJdsWWhCJymozTEdztQCjyHfSSfwq3mhOe?=
 =?us-ascii?Q?LGr5v8odAE54vzuItUvW53WnplCXBrV/8KXesbiwFnW7cclK5rFICtqE7d7L?=
 =?us-ascii?Q?cUJR3iOJLOK+uRS8Q1+TUJPx6izNE8zDtrtaNyVEgiEQRjrTgN7sKUjlGAwm?=
 =?us-ascii?Q?P/JTTaHywpmYI/1A3w1IO4GZXLC6YdSfURnBJkOEmTOKY6IuzjdIy9+AtgIw?=
 =?us-ascii?Q?/G9/NpTGhuHh1SroLdr7ADpt/DP1R/IpWQm95ZN0ntIVYpfwTduANn7XM2WY?=
 =?us-ascii?Q?VuRxKzPAHNkXTdOromRjGnBi+i4bFr1x2de1p/9SR71zNjwj/LL92Lobcs6m?=
 =?us-ascii?Q?smAXlcOdh9CSQ9Bk/N3VGbjBviBeho87yBePDNtIpRC9mNBLLzEKvEMaf+0d?=
 =?us-ascii?Q?Iaf/SezbS5b62zMQcCPuK9B6xp88TwZKRGW/MW6J?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d74234-9fb6-4186-da8b-08dd7cb3f853
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 06:57:36.3373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h2r/8hW5z0q9m8WV6cgpf+hiiytL2DCD85XuqwTOYiK1ECIVMdwve1QLvr9za2K6ibK0aOOm5RuRQZAePMbcLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7121



> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Monday, March 10, 2025 6:31 PM
> To: Pankit Garg <pankit.garg@nxp.com>
> Cc: linux-rtc@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; conor+dt@kernel.org;
> alexandre.belloni@bootlin.com; Vikash Bansal <vikash.bansal@nxp.com>;
> Priyanka Jain <priyanka.jain@nxp.com>; Daniel Aguirre
> <daniel.aguirre@nxp.com>; Shashank Rebbapragada
> <shashank.rebbapragada@nxp.com>; Aman Kumar Pandey
> <aman.kumarpandey@nxp.com>
> Subject: [EXT] Re: [PATCH 1/2] dt-bindings: rtc: Add pcf85053a support
>=20
> [Some people who received this message don't often get email from
> robh@kernel.org. Learn why this is important at
> https://aka.ms/LearnAboutSenderIdentification ]
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report
> this email' button
>=20
>=20
> On Mon, Mar 10, 2025 at 12:08:45PM +0530, Pankit Garg wrote:
> > Add device tree bindings for NXP PCF85053a RTC chip.
>=20
> Looks fine, but this can be handled by trivial-rtc.yaml.

Thanks for reviewing the patch. I will take care this thing for the other r=
tc drivers.

>=20
> >
> > Signed-off-by: Pankit Garg <pankit.garg@nxp.com>
> > ---
> >  .../bindings/rtc/nxp,pcf85053a.yaml           | 44 +++++++++++++++++++
> >  MAINTAINERS                                   |  6 +++
> >  2 files changed, 50 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml
> > b/Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml
> > new file mode 100644
> > index 000000000000..177afbe128d4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml
> > @@ -0,0 +1,44 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) # Copyright
> > +2025 NXP %YAML 1.2
> > +---
> > +$id:
> > +https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> >
> +cetree.org%2Fschemas%2Frtc%2Fnxp%2Cpcf85053a.yaml%23&data=3D05%7C
> 02%7Cp
> >
> +ankit.garg%40nxp.com%7C32d9900da5904fe7396708dd5fd3946f%7C686ea1
> d3bc2
> >
> +b4c6fa92cd99c5c301635%7C0%7C0%7C638772084538208218%7CUnknown
> %7CTWFpbG
> >
> +Zsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zM
> iIsIkF
> >
> +OIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DyL5SU%2BPRYH
> AFtSruf4
> > +b92LlR2ybu%2FeQb5P26ys61OMk%3D&reserved=3D0
> > +$schema:
> > +https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> > +cetree.org%2Fmeta-
> schemas%2Fcore.yaml%23&data=3D05%7C02%7Cpankit.garg%4
> >
> +0nxp.com%7C32d9900da5904fe7396708dd5fd3946f%7C686ea1d3bc2b4c6fa
> 92cd99
> >
> +c5c301635%7C0%7C0%7C638772084538226346%7CUnknown%7CTWFpbGZ
> sb3d8eyJFbX
> >
> +B0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWF
> pbCI
> >
> +sIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DkqAHKLyHEc2A%2B64WxNmE
> eD3wruOU4F
> > +JMkkYg9SBiQWk%3D&reserved=3D0
> > +
> > +title: NXP PCF85053A Real Time Clock
> > +
> > +allOf:
> > +  - $ref: rtc.yaml#
> > +
> > +maintainers:
> > +  - Pankit Garg <pankit.garg@nxp.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nxp,pcf85053a
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        rtc@6f {
> > +          compatible =3D "nxp,pcf85053a";
> > +          reg =3D <0x6f>;
> > +        };
> > +      };
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > 8e0736dc2ee0..21a05e169564 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -17158,6 +17158,12 @@ S:   Maintained
> >  F:   Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
> >  F:   sound/soc/codecs/tfa989x.c
> >
> > +NXP RTC PCF85053A DRIVER
> > +M:   Pankit Garg<pankit.garg@nxp.com>
> > +L:   linux-kernel@vger.kernel.org
> > +S:   Maintained
> > +F:   Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml
> > +
> >  NZXT-KRAKEN2 HARDWARE MONITORING DRIVER
> >  M:   Jonas Malaco <jonas@protocubo.io>
> >  L:   linux-hwmon@vger.kernel.org
> > --
> > 2.25.1
> >

