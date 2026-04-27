Return-Path: <linux-rtc+bounces-6428-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEjlKGn57mn82QAAu9opvQ
	(envelope-from <linux-rtc+bounces-6428-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Apr 2026 07:51:37 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 107E346D578
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Apr 2026 07:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1028430053FE
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Apr 2026 05:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0F4352C5C;
	Mon, 27 Apr 2026 05:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LBZs6uNU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011035.outbound.protection.outlook.com [52.101.125.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540732DECDF;
	Mon, 27 Apr 2026 05:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777269090; cv=fail; b=qSfq/pLXoGX5RmNY26jnRaqYJz4Fb+xEUfwwz1kh2nbwNl8JrQqSs889uZPTl/ZuGMyrj5eEyieSMi1wpNT/yVBuP2JK75gHSJxy2zq11i512Hb2sImMMx6LOM3l4bPbq/CJ9yN9d6HQ8LfEBmCv7hdBxWh9viKf5UQfmVtaVCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777269090; c=relaxed/simple;
	bh=sj93A8X90I60jJipDhgra+6sjh1fVSkeIYx9kIbtcNM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h7R2Fcjo7NcRkb9Ur+GD9We8ZD4y8k+9+LQuqSRZvy/Oq7UQexAGo+4So/QR3NNsV7WieaKAYSQ2czmtGq3DkM0kf/ngmSwf21mbnM3D2Pla5/7K5NcSbOUMbYceuOAPi42Bmzea11qwb8tac5eSmEU/GcVFikrnUBj6QC19Liw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=LBZs6uNU; arc=fail smtp.client-ip=52.101.125.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iRMnk8fcVzoDZ07AozF2/BSfv0bofOGoj+AVHfy3Es3F7SkygwZ6G8ui+KeWt3mRe5VS087mT0XO+kzkAwq0vOmbxnMr/Z3lht6Uqa03I+qCvKXur1WrjJj9Jdm5zLdOlwZGVXe8IkOX64tTgEv1ImrbU4rHIRh0fgt+iCp5lU5T90zcNwjcNH+vAUAMt/eXBxtLiQ2Jk24M0zHadJ7L7FDecqttIgS/ufPfb7TzXG/eur3M/pfHHCs/iW5hGRiYXc8bSuy4mnKbLsyxDKRQakhnEIRY1L2SgtArCdY2C4x1nPEhArhupile7nOUqIPLoo4TLyBR5pp0wMJ8obS/7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwKxEiF4TohhZvFVXZgyyV7T6cw6XAY66St7F/ttQds=;
 b=X+IMAB1b7/So4CoZWPBBrDSdpB5hB5aA89raP6ygqNXKrpjRRN0UCIVPiA5vhOiavrzxqDUoH553BtRHg8wKsV2lJMTy7o3W1tPpDA/MFLlx3NqyIUxEK0im0YIBb3QzfY73Uxyjnso4b+sifutWl4H2kXDF2vBRaHD/DL7Zq4wirQLpcUlJuWOilfeBPD6bdm4mUjdJjj4ZSxfab16be2MtPeV5gfGCJAh74OaUJx5mOaDZuiO83igS0gw5vkm99sOY4yy08tycffM6JFQz8tSffP2MsEA9f6WzufdPeAxc13XUugayMaBgFLwNObCCvBxmoAkQDeYd4/NXJEBHqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwKxEiF4TohhZvFVXZgyyV7T6cw6XAY66St7F/ttQds=;
 b=LBZs6uNUWqs9qgRkhg/EHXN/37zwiZFtmUu53WHGT2dhj2JBsg9DMbnu1hJxjMxpEPGzbb8jzvQttZvBWaRJ2OLvobpjDN1IsuSpKYDlnKqc7nLkt7LoFB3lWJHndebufkeMRSrx2m9Xpxnk6TNrH7wHGhCqeMriGO7KJh9+TA8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB13064.jpnprd01.prod.outlook.com (2603:1096:405:1be::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 05:51:21 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 05:51:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC: "ryan@bluewatersys.com" <ryan@bluewatersys.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"m.grzeschik@pengutronix.de" <m.grzeschik@pengutronix.de>,
	"Denis.Osterland@diehl.com" <Denis.Osterland@diehl.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>, "open list:PIN CONTROLLER -
 RENESAS" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/2] rtc: isl1208: Fix returning errno as irqreturn_t in
 IRQ handler
Thread-Topic: [PATCH 1/2] rtc: isl1208: Fix returning errno as irqreturn_t in
 IRQ handler
Thread-Index: AQHc1MtpASnRMIE8KkmYq1oUowxYhrXwA9IwgAGcQwCAAMkD8A==
Date: Mon, 27 Apr 2026 05:51:14 +0000
Message-ID:
 <TY3PR01MB113464D38D90D01C5ED83BB9D86362@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260425154959.2796261-1-john.madieu.xa@bp.renesas.com>
 <20260425154959.2796261-2-john.madieu.xa@bp.renesas.com>
 <TY3PR01MB1134639F6A3A38551180B626386282@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY6PR01MB173776D008E8D0D5DAD622A0BFF292@TY6PR01MB17377.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY6PR01MB173776D008E8D0D5DAD622A0BFF292@TY6PR01MB17377.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB13064:EE_
x-ms-office365-filtering-correlation-id: cda8a1b9-8d6f-49a7-6f94-08dea420fe6f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 f2xL0ruC1AT099oZMO+xe6nPDA2bHFTR9GZ6oI0bhS2YcgYizOpP8KZjLUI4YK5mqdH5/gVLg4ipBYKmkONfdxa59hPLsivdT0ErvftpE4eT0nSAXdQR3NJVrfgTogUysoDq11gi46VqhNtNH+4LoOmRq8kUCSUjg9Sv2MKeFkWNdtXrHyNd69fwb6vUQPuP/9D9WLKEJiuDSLovQnd0Ctl3ltZcrg50WppvP6iblw3WfgZmnn7TUTgLF7OKf681TSUfuyqSDhIuNM6u9dwKQTfT5wPOocsGRRYfJ2P7eGX02i3BokBeaN/6bzFMBuOpuqEl1LJIqaUo0BQTJv7EK4ENx27Hj9eirneLYPP45Wys8ZEysDB5DBP/1UrFmW8lyTk0T9B8yjFYvU5DH7EBwr0ntPvJv7/7r28dnSq34eVMYbxOi28BL2ltSkEPKLbNjdZvayLu0JNzQNgVNShlb2ymyzdY8NUST/473/8aAbTPTacJcTiRGn0asmkXVimgLXxB/y2ck+SoIaaj6OlXdfjo+mNE+O1QE5VK3rWs1QwgaeT3cX3qe2Nesgca7sFtnxnVml4m1eIogJpxaUt2cSd8Fi8RPD/m4fEt8GBeILdixQCAuYQ5OYq92GavKg8rteiZiLisRqp1eLsfZV4vc5C8sSVTdT4aSdLCZGYTp6mGnnAQACR2YnlFTvVOUmDw5kEk1Qnl+4Jgz2B7UtrkA2LU2vNG2CLTXHiPhDrPQsLsLfcEXveqeCWomUaa6krU+le5bYZftT2TmNXzAtzwdsVzOF/pf/gpAQ3Mp5cx2Q4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?oWwJOR5wKkxJzThj9cWO2M+xxB/gWl/Ali4XwzaJYl8Ag/UHZE9wTyTuvwJc?=
 =?us-ascii?Q?bS7UWw+AlPMTUcZt1zev2l7Db6NsXJf4Gtblb3P/NiD0/MGvoMkrB4NjbK5o?=
 =?us-ascii?Q?dhIP2RRCCN+neq5BJRxjZktGupVcMxZncUYE7zbXctpXYvnOfmL4tc2Lmq/3?=
 =?us-ascii?Q?8gogzUdyWmVkech7Z2fZHHVFBeSt7Ymowy1ZLVCCXeNpP8qytPHzUSu5Z1VL?=
 =?us-ascii?Q?OoOqxtIMr/1p8fkBD9dcgCXMAu9oSxzpom5rtDJb6OHy8JKlB6/xTS8jy2Dq?=
 =?us-ascii?Q?nayKS5ao+3wvrjX3WX6EFP/N2A/BCLXU1iJTJCXLrJ2wS8cJXDJshHvWw9D0?=
 =?us-ascii?Q?TrNVSfNfDogadUsYt1TFw6MB1Y2KxJhBiiarCVjXnZiMbrZt3YstHpyGolIe?=
 =?us-ascii?Q?WzzU77x9WqSPdCHnmd5NKiKjZ0+abDgOt7DSXj3lge7JADUTti7pK5WEqPwr?=
 =?us-ascii?Q?4OxwSgjVVnKlsJPkpP8FO3upyTXjSfz3PGicToOtdrMwQMuDKuIQ92/XoDX5?=
 =?us-ascii?Q?OqPAs7SE/dS9Wv3pCrIVbaUKJdroovmutHY7Q52gONp2Fp08JrQLgFauaQ7S?=
 =?us-ascii?Q?vaz+e00MEHcSgmIctNOPJ5KlCEBdta3TGkYLIF9TN4JJvBQANa8TK8a/sYOi?=
 =?us-ascii?Q?MgTCePVdnx+uGjxjLRx3wJ9riMBfe54lOyHaNOMhGuZis5nd6XnC/ARmsIA6?=
 =?us-ascii?Q?ZgOXVAIGHxXYjy4hAVgzt/L4phulB0TxlvQhXQ+LqU1dFaLuiMM/q44vi42v?=
 =?us-ascii?Q?3/fszUd3aH1P2VuwAkiCrFprjC3L3RpevDuhBEf+ihizvkvY9TZd3VVxOwUU?=
 =?us-ascii?Q?Ag+bdK19rk9hdhXmJKpVxr2sEirwSTLcN2BSY0xv8tiOjWt1FI+V5xN+6Ymq?=
 =?us-ascii?Q?pReFtm030hOlMoJhRtdpaGzq3f22vmEVIcUK3ci/ZMia/3Z3NeSFawYx+wIU?=
 =?us-ascii?Q?WWJMftVFqEM53GHsoNSeahOzWBT5qPndDvriUGEnGX6kW6MfGazpvxnVyvOh?=
 =?us-ascii?Q?HTraVvw6QH4ksevczhSi3dpjDxaW/n3qxqgLpvaTZuuq0rYkv0bV1ooVT0Sw?=
 =?us-ascii?Q?wVkOlgL5b64SNpk3HCIvZJmlvGfBCNmK6F+n1f3mfnhMshjXkaupMPQ0Nt6R?=
 =?us-ascii?Q?jjzSoenaioCmHh03FlOtJWDQaRVWUCNriuWPb4ikC9LJy2/eHAnOpmeWtRw3?=
 =?us-ascii?Q?PkjZQnR9n/PAwOD4sH5OlKsd+Ro7UicFUPNg3k9PzAcdrNQmw9KfFhJLyL2m?=
 =?us-ascii?Q?/m2fsxfWM8vKnciMLWqv6EqIYjgl81yz2cqJm283T++8vE8JXP9d44RhzFc8?=
 =?us-ascii?Q?R0zrUPQHFIV//WfXoJyZ5bp8qFgHOQLIY3SQc1JPxxknbMfshVWW94/d/2yQ?=
 =?us-ascii?Q?zHyi0ify5f2qCESC9XQ/rNJy7cYIf7nnbrHSTG0i/+seOefDdgOKEQ+Prw4u?=
 =?us-ascii?Q?pxc8KhTwJlioZrUcLnWwqow/q1E0DANr6YN1dy98KeLjMo3H0Q87jdyK1AaU?=
 =?us-ascii?Q?p2Ce2z3HRPMBGb/awPWYYfz70nhz1iTKLzaesuabSsCiLK/peKApQS7UdT1Y?=
 =?us-ascii?Q?YJmxBNf3N2+EFlCSiTkz6v6YXayLmJ9EjjI6oZM1ISL/2+Ot6jlVR/MVQXtC?=
 =?us-ascii?Q?FK8oFpiwEV4FPBfZrla5oxCmQ53LClrzstQmBTG7lTdkIMqYZpT8tBLJV46f?=
 =?us-ascii?Q?uLOfvSpSreMVj/X0PwXJMS5mw9wjGki9ry6Ho1kpi1OBjmgCwln07cwELq6B?=
 =?us-ascii?Q?RjW2dQKzpg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cda8a1b9-8d6f-49a7-6f94-08dea420fe6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 05:51:14.7781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W4J3IllIsxPPx3ZVS5FJ182rg28zKNvw/KFgQpEa2S/IUgWrquDGq94+KpcuWtzDsZYRpKSGoC/l4pBDQKxBYPLzvkh6ArtHFjb9VxHVNY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13064
X-Rspamd-Queue-Id: 107E346D578
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-6428-lists,linux-rtc=lfdr.de];
	FREEMAIL_CC(0.00)[bluewatersys.com,linux-foundation.org,pengutronix.de,diehl.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi John,

> -----Original Message-----
> From: John Madieu <john.madieu.xa@bp.renesas.com>
> Sent: 26 April 2026 18:48
> To: Biju Das <biju.das.jz@bp.renesas.com>; alexandre.belloni@bootlin.com
> Cc: ryan@bluewatersys.com; akpm@linux-foundation.org; m.grzeschik@pengutr=
onix.de;
> Denis.Osterland@diehl.com; linux-rtc@vger.kernel.org; linux-kernel@vger.k=
ernel.org;
> john.madieu@gmail.com
> Subject: RE: [PATCH 1/2] rtc: isl1208: Fix returning errno as irqreturn_t=
 in IRQ handler
>=20
> Hi Biju,
>=20
> Thanks fort he review.
>=20
> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: Samstag, 25. April 2026 19:16
> > To: John Madieu <john.madieu.xa@bp.renesas.com>;
> > alexandre.belloni@bootlin.com
> > Subject: RE: [PATCH 1/2] rtc: isl1208: Fix returning errno as
> > irqreturn_t in IRQ handler
> >
> > Hi John,
> >
> > Thanks for the patch.
> >
> > > -----Original Message-----
> > > From: John Madieu <john.madieu.xa@bp.renesas.com>
> > > Sent: 25 April 2026 16:50
> > > Subject: [PATCH 1/2] rtc: isl1208: Fix returning errno as
> > > irqreturn_t in IRQ handler
> > >
> > > isl1208_rtc_interrupt() is of irqreturn_t type but two paths return
> > > a negative i2c errno instead of an
> > > IRQ_* value:
> > >
> > >   - The SR-poll loop on timeout: `return sr;`
> > >   - The post-alarm cleanup path: `return err;`
> > >
> > > genirq's note_interrupt() casts the return to unsigned int and flags
> > > any value above IRQ_HANDLED|IRQ_WAKE_THREAD as a bogus return,
> > > logging "irq event N: bogus return value X" each time it happens.
> > >
> > > Return IRQ_NONE when the SR read failed (no progress, can't claim
> > > the
> > > interrupt) and IRQ_HANDLED when toggle_alarm failed.
> > >
> > > Fixes: cf044f0ed526 ("drivers/rtc/rtc-isl1208.c: add alarm support")
> > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > > ---
> > >  drivers/rtc/rtc-isl1208.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
> > > index f71a6bb77b2a..c93998c53e7a
> > > 100644
> > > --- a/drivers/rtc/rtc-isl1208.c
> > > +++ b/drivers/rtc/rtc-isl1208.c
> > > @@ -654,7 +654,7 @@ isl1208_rtc_interrupt(int irq, void *data)
> > >  		if (time_after(jiffies, timeout)) {
> > >  			dev_err(&client->dev, "%s: reading SR failed\n",
> > >  				__func__);
> > > -			return sr;
> > > +			return IRQ_NONE;
> >
> > Maybe you can use a goto statement?? that will take care of handled
> > IRQ's
> >
> > 		goto err_irq:
> >
> > err_irq:
> > 	return handled ? IRQ_HANDLED : IRQ_NONE;
>=20
> Agreed. I'll do it your way in v2.


>=20
> >
> > >  		}
> > >  	}
> > >
> > > @@ -666,7 +666,7 @@ isl1208_rtc_interrupt(int irq, void *data)
> > >  		/* Disable the alarm */
> > >  		err =3D isl1208_rtc_toggle_alarm(client, 0);
> > >  		if (err)
> > > -			return err;
> > > +			return IRQ_HANDLED;
> >
> > Same as above.
> >
>=20
> I'll set handled =3D 1 so that goto can return IRQ_HANDLED.

Looks this is change in behaviour compared to original code,
previous code does not set, handled =3D 1 for this path.

Cheers,
Biju


