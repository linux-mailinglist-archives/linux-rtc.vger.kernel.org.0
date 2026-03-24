Return-Path: <linux-rtc+bounces-6243-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNMjLzaswmkyggQAu9opvQ
	(envelope-from <linux-rtc+bounces-6243-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Mar 2026 16:22:30 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E07317EB8
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Mar 2026 16:22:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C978D306773D
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Mar 2026 15:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096B7405AD0;
	Tue, 24 Mar 2026 15:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="N07bvxJL"
X-Original-To: linux-rtc@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011028.outbound.protection.outlook.com [40.107.130.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989643E0C45;
	Tue, 24 Mar 2026 15:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774365685; cv=fail; b=pgVDqGLlZuCb9WYQ1uv6cyQMtvwi7iPOvU8xxxAkAHQT+cCctaiGJEKVflIB9iebkXHoE7bCLBGuR1S74h1lyED5c3Y6EbBlsJON6RKtazsHNvS5zYt3RCcwbhNhQoWp6o58LDsZSLGb/cQMduNv5SzuPr3QAj4rEVOGSQ9Z6U0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774365685; c=relaxed/simple;
	bh=5MK+h3ggZlG46Lf4TPI6j52Ll7VhfzdOOgNZDzr/Wgc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UFpWMDalRt7p0RbiIAoP0BDM9OYT0tcwlbjKk0zCHmnPySA7T6l8iOGRU5H7Xi1i1sqBLhztzQ4/huSuNmrGKJzTO1KP75xex1BH5ZrzeinU7vTdZW4SGRaHGYLx1+ZxbmndpCzHDG9SC3K5XW0nXixl2NFIhh5TeqLRt63BPPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=N07bvxJL; arc=fail smtp.client-ip=40.107.130.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVqj3J6AqZMgHrSMYmBJsewQTk8E66Fw95OUS4tAnlrHzGyrogYSyMwmtvi9RPVTci6130vcYV1qirbR38lFMZbUzMOjNIvjpawULWrv3Pj5Ockk5Wyy0C2xyKzNZ6ZhwfZ/UaEb3qsDHycdp76kBHxOOJeCMxIlW26dosMtwajP6q0yhqY6MrkwPcpGwNKgBh04/106yR9+e189Qv0bPHr++0ye7Btc3KVzukGxHFThi+NT/mXtXtFU2qCdbbGeWuwZ7ITuZKWc3+y/wqHpr0ANzI7lh5pQ+R1hhDTrCB6qZUXib6Irin5cp+cLiUekVfZGZ84aNkrSeIbMpJBYTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcQCKRlN0PXLi3IdgDhRoSqdU9e1q0+UzLkBIyCMvUw=;
 b=V2hQH4TPGIcrlk5yWxNQtW8CKP0rnhwYPlAl8JBeICG0BP1dQxCu5kVRxVQGtdRxoJ1zqmwXFmnaKnWr9FjitP9RXC3D2o64hDL06jzotG3F+gf4a6fqp39ClE+BHc5Sx9K2osleFH4UyMm/mO+W9vBQxq5KKOXRGUCKMK0bVkbpuTiCnLFU1pKVSguMXCyG/YYgnbcsH2kAoq6V85wwND+H8kczKBlcVLSLnuzZrQ+KyK3+M5TjfGT6c782RmRZl6mz/NtikpovlF93EQZWiUZXHal0BAX3Sy3uRhTxCgaWCUsK4m5fmsgMwGjSorDPstLuqAhvHtm+MJqLL/3kzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcQCKRlN0PXLi3IdgDhRoSqdU9e1q0+UzLkBIyCMvUw=;
 b=N07bvxJLsPdjilwXBLX/7WBpq27fBwkQOH86FGaJItYQjrt0g/Jus8RO5OoN+CBAkY89zzTfXxwG3fV8fmsUVAi+NX1uxU8ABNJw31ms4oewGeqST7m/s14aDk1zzhoSnxbKEEXEL2IaYXNix92HtCoQ9G8hgRAss1dszxfGY99wotphrBF8bksL/xUH6gXnTIF3vlOAI8biUsCDpnRF/GOPepKdVlq/npYpjYNAkiDbITOPq8ftQCNU0SF44j5H5EZdWd1n7aBvOaCiQG81GuavPuvrW7ZJ691cgtLtpAtAeGyf7qaVcHTQzjiIPSDrtelhHJVrsjiekzLOsZeQlw==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by PAXPR04MB9325.eurprd04.prod.outlook.com (2603:10a6:102:2b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Tue, 24 Mar
 2026 15:21:08 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.20.9723.022; Tue, 24 Mar 2026
 15:21:10 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>
CC: Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>, Pankit Garg <pankit.garg@nxp.com>
Subject: RE: [PATCH v7 1/2] dt-bindings: rtc: Add pcf85053 support
Thread-Topic: [PATCH v7 1/2] dt-bindings: rtc: Add pcf85053 support
Thread-Index: AQHcX5YSbxaLSC8IOEuGOO6UoJ4wY7W+hAVw
Date: Tue, 24 Mar 2026 15:21:09 +0000
Message-ID:
 <AS4PR04MB9362E789680D3D5E58E235E3FB48A@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20251127120456.1849177-1-lakshay.piplani@nxp.com>
In-Reply-To: <20251127120456.1849177-1-lakshay.piplani@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|PAXPR04MB9325:EE_
x-ms-office365-filtering-correlation-id: c0bee7ab-34af-4c32-36e2-08de89b8fa7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 UcobSZxCJCQmIJfedP85DtFVDSg1f/BFVFNRThjskVN7eYeq05U4eJZbbhRYYDS9rScDtKZ5A1JNlOWxYxmWQ6eE7612uRyBk3Iw0QYFrrJfQbryf293IzmTKvUuJuORs1G6cKHch7fMN6fvqIkaCW4GEJVk1Ad/fjeTn20XR+2EvowhHHckNyy0ELoa0ftAkPKPiAUijOX7emI652ZhGErfxnOzOk82t8t691jYeLHnuwM29pwF22xjlE3XYlN7PWfZEajuWemhV14qvZWxE29j93/6HACI6m6lVK8/xL1GUtJtv893ZR19v+MXrFvgLtWXla/RyXd9YCTpBKMmRQCHUWDviV0v8IBvc6gOkcCpQIBQqj/ayI8m8K7Di8HuTY6zM8UC4lRlJTiMm+iIwxLvHLhzP82F37Js4rKU+Jf8Z5Gp/tedgkwO+OlHiNlON82eaJwgGDHim1/A+fmr98qzEiVoz5f8W31Oz8LuL3QrqhTzyAB7zyOA6E8xkk5L51hb9AKV1GG47rIph/Qsgo8DSOagK5D4AJwVj8ZnTlYVyGyCRQu9Xm0CheLc5SHXleAnW1KR/4geXx+zkDBx0BEo2YnW6fu+XfjHvaakngTpFBRXcK+G73QGCuWlwVG5u/HUjoIFotBsmTrJ6ogBiGbl7L7MjCkjr55j7OycO2+HtmSPSeTClnyyfeu0fPbXCqEYdWoqsRTDKLhP/I/rom9twhG2zvMPNwR5id+pt9kCgMd9ZPMQMwEo5mfSZbdT5MuwGxmyNvEDw7V7gHxXP9HWFWd3ensHOMIVKCphSlY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4BatqNOU0roQ+ct/3K0rL3RDuiHo3Kwb71IybaBNIEGO3i8hTBZSLdSyUSrz?=
 =?us-ascii?Q?gw9vHNxON6vJQgs9bqbMEV+i+jAyDz9RepbargqxQJb606EP+SQOA0N9yKKd?=
 =?us-ascii?Q?mTnDafEEmFlmV8xenkcfkeCOvXwOtKk32ih5RMcThQGzQLBATaFOvwakHuhz?=
 =?us-ascii?Q?IZ6BB/ZeaSQKPsmMAEKbWWwS5zCaZjtO+a5iWJU2H3iGyZf1ueu5ONbQCpRs?=
 =?us-ascii?Q?JCiolV/7JbYDs40sUUkNSijy8b2wJVPyWRcYO6sDEfBfD4yMUp2wb+RhdU9T?=
 =?us-ascii?Q?GTxxSXrj/ZlU9TPV/bZRwAkXEy5asIKD31g1N0a4bF6/9NOliYCcLTUOeW8P?=
 =?us-ascii?Q?Z32svb351QmJITW6Qor9mnaQquW1aJPpEUtuDnvV6jeaGLehpo9VoFJ6EM9B?=
 =?us-ascii?Q?iFznOYo4PAxJ37qWfhaQrmKomCYftF5lTmsMVHNARBVmY+pbsyLWqxEYH7py?=
 =?us-ascii?Q?246LfslaZY+Wuic6e/nTbJDXFpB9XHxxwASMrxweVF5xSVx6fKTKiETdz1fh?=
 =?us-ascii?Q?PrwXEcNZL5+VXvaUs6WynWYpfMyLtNPQkw4UneOBL1LF1zcRysQFV+btz6i5?=
 =?us-ascii?Q?lEbtJZt8PyTB3iVkoudGuf1vuC0wga/WdqiR54ZkfhFSkvzK1Oy2plqohne9?=
 =?us-ascii?Q?HoZ11rTFKzoi7tjiCxO+uKrItAmglURPen3mmKROzc9oqezZriT1Kw8CRiKu?=
 =?us-ascii?Q?XUW1FY3haKQJ4j4a0GQgWOmFFQyzmj0OXLT7W5+RNHB5EK/+mEQYhOtp6dg4?=
 =?us-ascii?Q?hytakAgq/j+SnJUFmhEC/p0QgrLsUs363Jzci2zTzg8xRtTCfhrnl1xw1nOb?=
 =?us-ascii?Q?PEBgp1tq0hxYot9UZARV2JnhP5L2uXe43Db1MGRbMwQR4LGck0Wr6zm921kk?=
 =?us-ascii?Q?aB0v/iejqQB06PeswLWTx6AI0nEgXEwxoKyBcKXwM5GpHiCjlCRHfHaTSCi/?=
 =?us-ascii?Q?OuvllSWvnb4mIGdUarZOb4BWqtHjtwVGcDZ0nQnL0sWRySO1Praqxw5TOkaO?=
 =?us-ascii?Q?19PvscWY6/+f6Ym3KJi+QXIlE16WI79xkbGMryWOWtr0YWgMhZrnn2SNZbHE?=
 =?us-ascii?Q?wBhBa2cSX/cWL69XO3/45XxeFtK3bUl+kDE9u5KcFkEsEOAyqWkem4xxyA9I?=
 =?us-ascii?Q?QCoEQbd/qjYnbRPUn3rJ1yV/0Lvh1RO6Y7qrzMB3ReTxkrwZix/77RNEdIvT?=
 =?us-ascii?Q?X6Q65tr19UqpSCzQLyToGkYXquERMPLWBLp/kLvZHvz87p1Z4DZhSbKk6cUd?=
 =?us-ascii?Q?IQbu9lPaBCGXF2LZh1qsj2C8mUeeKZmFGEQpb1+KzV+p5ioQIr3zHBYf5X6M?=
 =?us-ascii?Q?XRw3fB22FhftLGZU1ghaGman9Co8upo8/VllO5B9deciN0KXVvxPoPQIipVn?=
 =?us-ascii?Q?tWkPb5Gr3FBGRAC4hVzH1Xye1vd9NaKj4Tk9gSS6+fxeiajcXzc8f9kQtbyU?=
 =?us-ascii?Q?6EZZAh69U8eKNLoCn2sE+GgRDAR+CFGi1+2PrvjhGLydYnEmoEteAdKSp82q?=
 =?us-ascii?Q?0wU1fvAKPViefur/POdXtdypkLpOP8786K+s++yfcbPas8aYVeXeMcNYjyvU?=
 =?us-ascii?Q?9cBsnP2oDqMdMyZdEiAeqeRdUzqsh9o1feZT8coTdMfcT1J2Pof4PL43edE7?=
 =?us-ascii?Q?tmB4QegRfdxPMP/t0XoeqwbNOzUB9LmBBWq62kvOHQFgMtYEPHKTWcQ+Dfa7?=
 =?us-ascii?Q?2m+YdnmMu+DOM//DWhhd5kgxvR9EfgxnF8K5atVm5Urt9iC9EsHJrIcatigM?=
 =?us-ascii?Q?7klFDfnQEw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c0bee7ab-34af-4c32-36e2-08de89b8fa7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 15:21:10.1470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EJOCO+vDWhpCpbIgew3/QjcwmrUBXLaEOVwstEodcpB9ZYlmwPvmiZXVDKVyzRF3GydNw3k/Ksw24R2UPrO6DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9325
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6243-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lakshay.piplani@nxp.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,6f:email]
X-Rspamd-Queue-Id: 36E07317EB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> +examples:
> +  # Single host example.
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      rtc@6f {
> +        compatible =3D "nxp,pcf85053";
> +        reg =3D <0x6f>;
> +        nxp,interface =3D "primary";
> +        nxp,write-access;
> +        interrupt-parent =3D <&gpio2>;
> +        interrupts =3D <3 IRQ_TYPE_EDGE_FALLING>;
> +      };
> +    };
> +
> +  # Dual-host example: one primary that claims writes; one secondary tha=
t
> never claims writes.
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c0 {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      rtc@6f {
> +        compatible =3D "nxp,pcf85053";
> +        reg =3D <0x6f>;
> +        nxp,interface =3D "primary";
> +        nxp,write-access;
> +        interrupt-parent =3D <&gpio2>;
> +        interrupts =3D <3 IRQ_TYPE_EDGE_FALLING>;
> +      };
> +    };
> +
> +    i2c1 {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      rtc@6f {
> +        compatible =3D "nxp,pcf85053";
> +        reg =3D <0x6f>;
> +        nxp,interface =3D "secondary";
> +      };
> +    };
> --
> 2.25.1


Hi,

This is a gentle reminder regarding the patches I submitted in November.=20
I haven't seen any review feedback yet, so I'd appreciate it if you could t=
ake a=20
look whenever time permits.

Best regards,
Lakshay Piplani

