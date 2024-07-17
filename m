Return-Path: <linux-rtc+bounces-1542-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACE99338CB
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jul 2024 10:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 819CF1F24610
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jul 2024 08:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D67525624;
	Wed, 17 Jul 2024 08:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wF3U2AqE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010019.outbound.protection.outlook.com [52.101.228.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98421CAA4;
	Wed, 17 Jul 2024 08:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721204225; cv=fail; b=T1sA1xCvHJE7WyJVSh+6EWn+wBlCP4EZ62C+rzIoQ/BG0sQ2ZfZTfyszGwmaa3mno1CWXQzRc/UfcFlzl07//GZUBDDeU8mCSOEHogDb65Hd3q1NdIrnhQL+FnFNVYY5+8LOpp4R0nYpiesEb/r/ra52uxuhKPoko1AILSHh1qE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721204225; c=relaxed/simple;
	bh=oV1FgFe2z8C58g0dMctGB1r0ghLgwcy/vV/z3z6y0uI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NR+z1LaBjr4JQMmGUV7nAPNmmOhjYO3ZXhblIidDNtvgc2ChmpZUwXLSL2PlCWRQ7Zfg7NhhZWn+KpEg10o0qdh7GgmgVw3WvLMe1QVuR2WOY3WOwURHdtgxqFGvYSfHL58buvf+EvM8qWqEKVz0/9mGA9u6jbpzTfWHR+emcfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wF3U2AqE; arc=fail smtp.client-ip=52.101.228.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvbKMGTK2tjpm1Bl1Z8s1sL3Yiup6vPWLhWXCBbJ+60V/mzN5IiRrI9zoDRst2FSU3E6ow7lmPuLBtsAT+xchr5ir3zgwdMWIRC+B5wgAI++Ek3272yN42stgj9jeBkut9LshRnkFNeP84VbH52GLTarXV5CbdVNYBnP7o15B8iXe3Xqnk8ssTDN7ujxjCg4Z6BfRcbq19eDM9Ufz/J1t/2eAuLPw/29T7NRAtOymTlU94zS8tNWsyF0P8t0fJuxpDyPuXyCvpMj7gPOUOWtxq2fLVprngg4ekb16H8KxJ1Hk2HbqaSEXEU4S/IrnxCQ5bai2WafGgl8N0fQl8tJXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oV1FgFe2z8C58g0dMctGB1r0ghLgwcy/vV/z3z6y0uI=;
 b=lqF9uXjiVEctE+966Hlf6K7v5106hsVMBxknHdJs6FGm1RV5zidRi7isExk7aDSZMvhelNW2pA5xDmyTAsaFnhh/KyPrIxvcodZ3Dk6m11ouWqnRerqq+MDzVRQJneBW6TnPosk++oUjzpNjGBKj+xScsL8g8r0Oa8UIw3YY4/ooUNyqYwt57sUqxGReFkEFRGWmkvvwLzOH6GvT4QTJd1HXvp6FWrCn4I2R2Ftk3NAg0DuYQyWhJmAg/WdZuh4Czjsv6aeQIs30v43HK3ZJol1t3OwWcLh9Fg0UMgCDMWs5EC9Hb2Ud9FReRTf0H7fmGM2SSw3MyKzqBCBzPb+sfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oV1FgFe2z8C58g0dMctGB1r0ghLgwcy/vV/z3z6y0uI=;
 b=wF3U2AqE7e10VCAPAKwC4rXjPNs1X6eBRBEovMI8WA9T5JeLVsAx5By094wBzABCnKIR9IDHlYI1rv4XkjlQoKzHy1Dbb0IlcKjqM7rBK9N2ftG5J5ml8q9Ap4ZJLA0H+vdKz/rrjN+vrwv1wvZWfG4Mi9w3BOfdR8m9Q2pUwIE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB11135.jpnprd01.prod.outlook.com (2603:1096:400:3d2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 17 Jul
 2024 08:16:56 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7762.027; Wed, 17 Jul 2024
 08:16:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "lee@kernel.org"
	<lee@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "magnus.damm@gmail.com"
	<magnus.damm@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 02/11] mfd: renesas-vbattb: Add a MFD driver for the
 Renesas VBATTB IP
Thread-Topic: [PATCH v2 02/11] mfd: renesas-vbattb: Add a MFD driver for the
 Renesas VBATTB IP
Thread-Index: AQHa12tDxiFdQX5gCUGHOGSoT2m2RLH5MR+wgAFa5wCAAAfbIA==
Date: Wed, 17 Jul 2024 08:16:56 +0000
Message-ID:
 <TY3PR01MB113469836D16AA7172AC36B3E86A32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
 <20240716103025.1198495-3-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346E71D18A145DA70441CF786A22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <40d1bb5b-f8ff-4fdc-a2b3-b51ca8b11c10@tuxon.dev>
In-Reply-To: <40d1bb5b-f8ff-4fdc-a2b3-b51ca8b11c10@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB11135:EE_
x-ms-office365-filtering-correlation-id: 842a6847-ecfe-4a67-2e97-08dca638d2f9
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WkpBK2ovQ2JMSTJzM0lPU1haTmFVRXhSRjlDa1h4TTg1NEpIdUVxV0VlOHpN?=
 =?utf-8?B?NUhhVlRQRXJpWVdaL3VublBhTmYrNEFjVW1qc0d0aTZaTUhTOVVWVHpSSDJm?=
 =?utf-8?B?NXJQaU0xeXRxdjFlUGhCRlpyanZpelZkQ1BxRVdrVm45K0RBQXlONnY4aCtW?=
 =?utf-8?B?WG1EekxVc2xGaERQaTBNYWJzb2RGNTBPM1N3b0VrTWNZV25vbjdEdWVleTFu?=
 =?utf-8?B?eWFoanowSGlZaEI3RlZhTitnZGpkQlFzNml4TjYwSkdZVlM1VEYxMWs2bnps?=
 =?utf-8?B?cVNCYXoxR1RoYlJsanlGODFzbk9nZi9MRUltL0Y1SVZ4SXNDZ2R6a3N6KzNR?=
 =?utf-8?B?UkNrcjlySktzTnNYK2U3NmZ0Vkd6djN4azNWZG9idTEvYWNFTnhuVkJ1ak4v?=
 =?utf-8?B?MGhkS3dQNDdJY0kwbUtLWU80VTdUd1lHaGYxK3lZK1lXYmt4QWliWTNnZHJh?=
 =?utf-8?B?dDlBcU5iQVRyNnZpa0ZYUWNYSkJPZzR4MEhoWCs5UnB4ZnFUdUlvVlUxUjhU?=
 =?utf-8?B?R3k1ZndTRkxrZ3JEdXJoRThkSjVpandxVCtXK0FmZkFKU0Q1eDVaTWZiZit3?=
 =?utf-8?B?QVAwbjVZL051QzdWRG9pV1ZBaWN1SFdROEpjRmJnc0U0NGJzZGMxYTk2S2t6?=
 =?utf-8?B?eEk4VVc1MmtIazdueHFlN3d5Q2J5eFU3YzBGWDgwUDVucUlnRnR2QzY1b2Y3?=
 =?utf-8?B?dEVORmlLdW1teEpQaTEzNEc5UXc3Mnh1Y25ac2lkWnJnZTc3a2h3TEFCK2cr?=
 =?utf-8?B?Q05TQXh4dHpnQlpyNnNUdk9qQWpRQS9RUDRRbDN2TWtBOHc1YWJ5UDlhelU1?=
 =?utf-8?B?OU9nZSs3SkJWeVZHOFA2Zmh3ZEppWlBIdUErcWpJM3l4WmVKNzZ2dVdyclVW?=
 =?utf-8?B?d2Zhc0wyNUFhYXpZVDR2NCs0QkdGUzArbTRobVB0ODM2akRDOVl3QkY3eFd3?=
 =?utf-8?B?WkR3UWZXRVhPQ0F6THBVNTRuZEgxMUZHMDBZZkpndTFGRFdGNndhMFlTbUJy?=
 =?utf-8?B?U3NmTmJZOEdFMTJTT3d1d1BLNVBvZTRKemZobk1zVDUxS3hvY3IrVkZWS0RL?=
 =?utf-8?B?RkdVUGtlWDkvWC9OUisyaVc2bWl4RmVyZm9IOUdEQ3FMc0FUWVFOaGM2eWtk?=
 =?utf-8?B?MGcyejFDUHF3YlV1K0E5UzNjUzVLUE14SGFTTGY1Tmg4UktzMkw5K0hlbFpE?=
 =?utf-8?B?RW1tME5vclJldjY5VUNRSkNUME1uUVB1MWFZRjRxNWFnYVN2ZitxdXJIbkor?=
 =?utf-8?B?K1hmbmxYQlNZbFVoNlNKdnBpWk92Z1NRdHJiclZvN1drdmJBbG1tL09jUlQz?=
 =?utf-8?B?azM3bjRGNURoWDhPcDdodTdERDV0dGwvTUZUaWI3TXBnemRNOUdWNDhFZ3dU?=
 =?utf-8?B?RW1PVkNDUlJaeXlvakdYMVFVNndjSWFVNlMyRXBva0YrSm5YMS85cXFScitn?=
 =?utf-8?B?MVZhRFMzZGg1dGw3ZzIzMktSOFhhMkNtbXBKbmUwVWtPWnhRRXR0SENGdU0y?=
 =?utf-8?B?WEV4NE1qRTI3aTlEUzkvUnQ2cTV4elF1RCsvZFgwM3prZlJZRzg1VGFPYko4?=
 =?utf-8?B?VDdJaDdmOGYzVWU4U1dzY0Uxa0N1ZjFacWYzbDVIME8rUjl3bExTdzRmcEM5?=
 =?utf-8?B?dEVpQzlpcXpTM3dTNHFqYTVPM2V4c00wTnlEajFPdm1OZVdGYTZmOHA5TmE3?=
 =?utf-8?B?Y3JiaXk4SzgwSENseXFjQnFXcFVsOXNmMHZEbUsvbXlFVExhSjhRTFZtK0NY?=
 =?utf-8?B?anc4SDRTZ3puRzRhUUNSUGkrYzhMUUJ0R0JxUC9Zei9Jai9zd2xQTlZjdm1h?=
 =?utf-8?B?akNGRlNjVmViTkRYMjhRN3ZEY0pTZzVCSk9mKy9BZWJaZU81YlZlakVvSVJS?=
 =?utf-8?B?N0VNMUltOTJsTUp0N2dZcVpaTFlSMkNIbTFNbDMwUlJPYVlQQ1RHdk1UVHlY?=
 =?utf-8?Q?zgxWqzA6Kxs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N2V0d2hUWlBITURyUXpvZ1ROQ3ZWTXBmOHAxVkRmamhDaVMvcnREL05XaFp2?=
 =?utf-8?B?bTVGdDVONndYQXFTWGtWTkxQajk3WktmWlRFOWE2YUN6UUNpdlJWbzZNV0RR?=
 =?utf-8?B?ZU9yS0tWWkRaWFdRdmlKNUxEL1poYVNNMGFWQzNtMEREekErTkVSN0FqZlBU?=
 =?utf-8?B?MG5iMVdBNWRQUVVnVml4YXVUQjhreDkrT0dpeC9rRXh4Q2x3V3BaVTJORDZH?=
 =?utf-8?B?S0x2dUxLd3ZhK1FGWXRNSUVScDNaRzEzQ292QVdKdGtNR0JOYndpZHo1UVZG?=
 =?utf-8?B?b2JZT0ZRNlZTT2N2c2NURWJmWlZ2d1VVK1YwNEVGQ3ROU3BPdi9XbWYvM1Bw?=
 =?utf-8?B?Mi82MHBVekx3VzQyZDVUNFdxWWxwY2w1M2UwN29VdWZDVVYwK0dYaSt1eGJQ?=
 =?utf-8?B?TEZUVWtBV1MyWXp0QThpODJsV2VoU0l0bnNiVS9xQmVUN0NjOWFGUCtwZ0xv?=
 =?utf-8?B?MnhuQjRlV2xlSnVncjROQjVZTXFwK1lMSjRVU0lJMk8zVS9CWm9uOGhSSFc0?=
 =?utf-8?B?Zmx3aW91bVNhWnNaQStBNXFnZ0ZTY0d6aFh4YnAxb0Q5Q3BxTDhuNWp6ZFpJ?=
 =?utf-8?B?UmNaSTNKS3JJcjJQZDZmd0pyb2FFVHFTMlJyMlA4ZytiMmdPU1NweUkxN21P?=
 =?utf-8?B?WjduWUYzbS9rT0ZGOGxHYVBSek8zcVE0OTFNUEJBbTNYcTNQK1o3L0tDZTZK?=
 =?utf-8?B?bWpVcGdCVi8yOFBvQkVrcXRVczZOYWo0aXdNTE5IUDFQWGl6THhhYXFLOG42?=
 =?utf-8?B?WWcwc3o2R0F2cjRkeS9EYWV6Q094V3Y5RkY1M3l5aGRUY3F6eXZjSTltd0Fv?=
 =?utf-8?B?SC9ReENuYjV0WnFLVVZRUWM4ZHVuanc3dU5RQWd4cUEvYU96Zys3OERQTXh5?=
 =?utf-8?B?eEhhYW1aNExOSWlMK0F3VVRvYWpLejF1K3lMTTJsYW9VaCtpcC92TFN1ZzRi?=
 =?utf-8?B?clh2R0VzaDhaWWJEOHM4ZXpKaUhqbXM3dWF0UWRpRGNOU3lidHY2bm1PQmVy?=
 =?utf-8?B?SlNxajZWZDVzekpoNlJWSUZMQ3lPRjBoWVhWRmU3U24yaXFyTGFkdXNjNHZG?=
 =?utf-8?B?Q0FUa1lsTVU4Z1ArTU1Vd1NrTnlRcEtqSzZvUmZDK1d4N2tSOHE5OE9SVG0r?=
 =?utf-8?B?TndyS1V2YUZKZmQ4ZElhSzBjdzdLdkFtUEtIaW5FL0dGRisyekV3WHRTTXc1?=
 =?utf-8?B?VlVEL1UyRzhpWmhZbEttc0VjenQ5ekdLcU8vWGIzNWxVVFNLME5QYmc1aHN1?=
 =?utf-8?B?eUhZTzB4OG5kNzQrMmtGUmZHaEUyay81bnFpU1VvTVZiYkN6WGJLVnJwaUdl?=
 =?utf-8?B?MWlSY0Q4cUFXSFlhZERXR2Nra21TUUo0eFlpOGxyR0xScFlaeXZ5eXp6aGRD?=
 =?utf-8?B?RWJXZ0IzNDVPWG1oUFQrWS83VndJclo2eThwTEdUUlVRanlBSW43VkxOelRo?=
 =?utf-8?B?RUFNN0dMRkw5UVhvUS9GTC96eHVSc0RtWnRGMlpUbTlkelpZeTBPVjdCZnlX?=
 =?utf-8?B?ODc3RnpYMmRvVDN1YWJ2RFl5bmY0L0I2OG03ZHhkN2VtU0VMWVUzb3Y5d1RN?=
 =?utf-8?B?SEdDc3lIWHNJMldzdmZSVnVTUEJ6MC9FNzk5WDBFTVZpUVhYRVNKK1E2cFJL?=
 =?utf-8?B?ZmVJeE9CbFZaQUplamVGQTQwWXlTK0hnWTlDUzJLTEZGbGdibVV1L0VnMmhs?=
 =?utf-8?B?OXVQVFRxUVZxUWIrSzZrRms1WXJiUGxtLzlobVZTQlRmTm9aNldia3o0ZGlW?=
 =?utf-8?B?bW1ocHhFVXB5VTBwQnp3N1JlTlR4SFl1WTgvOHVoQ0FJa05kQlpEb2JTTkFh?=
 =?utf-8?B?MS8waHR4R0hkWC9qeXpZVUd6YmgwQUNkeUhaMGk5ZTc3ZXMyM2lsd2lnTzJ3?=
 =?utf-8?B?Vzl3UnZoM3B2TFhOSXFlQ00vWlE2amJqK0MxeWdkcm45MEFlNm1mNENWdENk?=
 =?utf-8?B?WVB3ZTQrTzZWRWZjYnAwa3REUXlCV01lcWNMNTBiTkxJZHFPb083SkI4ZElU?=
 =?utf-8?B?TXdMSGI1M2tjQWZuU2dDOGNZU2JvM0FhY3I3UzM5UytlblpzdUVCRkVTejQx?=
 =?utf-8?B?M2YvbjNyamxKWVg4RmRteHNNNmt2amIweDVBSys2K28ybXByc0tIZmtidGZk?=
 =?utf-8?B?aEdLMHJ3N0hSQ09GUTE4ZlJxSUZvdTc3Rm9CZVBVY2VjUzhFcEdWZWNoWXU2?=
 =?utf-8?B?Tnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 842a6847-ecfe-4a67-2e97-08dca638d2f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2024 08:16:56.7530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Szv8YDLDs7KvBIDmLfdr1bBihLSWtTd01QtFrgmHYGh08pBJgqhrQzUCTFCAIQWRKwPKulC5yyvMJWRmdVER8uiQ4Keh4zNeMvQipvpa/K4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11135

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBjbGF1
ZGl1IGJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiBXZWRuZXNkYXks
IEp1bHkgMTcsIDIwMjQgODo0NiBBTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAyLzExXSBt
ZmQ6IHJlbmVzYXMtdmJhdHRiOiBBZGQgYSBNRkQgZHJpdmVyIGZvcg0KPiB0aGUgUmVuZXNhcyBW
QkFUVEIgSVANCj4gDQo+IEhpLCBCaWp1LA0KPiANCj4gT24gMTYuMDcuMjAyNCAxNDowNywgQmlq
dSBEYXMgd3JvdGU6DQo+ID4gSGkgQ2xhdWRpdSwNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBDbGF1ZGl1IDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+
DQo+ID4+IFNlbnQ6IFR1ZXNkYXksIEp1bHkgMTYsIDIwMjQgMTE6MzAgQU0NCj4gPj4gU3ViamVj
dDogW1BBVENIIHYyIDAyLzExXSBtZmQ6IHJlbmVzYXMtdmJhdHRiOiBBZGQgYSBNRkQgZHJpdmVy
IGZvcg0KPiA+PiB0aGUgUmVuZXNhcyBWQkFUVEIgSVANCj4gPj4NCj4gPj4gRnJvbTogQ2xhdWRp
dSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPg0KPiA+Pg0KPiA+PiBS
ZW5lc2FzIFZCQVRUQiBJUCBoYXMgbG9naWMgdG8gY29udHJvbCB0aGUgUlRDIGNsb2NrLCB0YW1w
ZXINCj4gPj4gZGV0ZWN0aW9uIGFuZCBhIHNtYWxsIDEyOEIgbWVtb3J5LiBBZGQgYSBNRkQgZHJp
dmVyIHRvIGRvIHRoZSBiYXNpYw0KPiBpbml0aWFsaXphdGlvbiBvZiB0aGUgVkJBVFRCIElQIGZv
ciB0aGUgaW5uZXIgY29tcG9uZW50cyB0byB3b3JrLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5
OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+DQo+ID4+
IC0tLQ0KPiA+Pg0KPiA+PiBDaGFuZ2VzIGluIHYyOg0KPiA+PiAtIG5vbmU7IHRoaXMgZHJpdmVy
IGlzIG5ldw0KPiA+Pg0KPiA+PiAgZHJpdmVycy9tZmQvS2NvbmZpZyAgICAgICAgICB8ICA4ICsr
KysNCj4gPj4gIGRyaXZlcnMvbWZkL01ha2VmaWxlICAgICAgICAgfCAgMSArDQo+ID4+ICBkcml2
ZXJzL21mZC9yZW5lc2FzLXZiYXR0Yi5jIHwgNzgNCj4gPj4gKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+ID4+ICAzIGZpbGVzIGNoYW5nZWQsIDg3IGluc2VydGlvbnMoKykN
Cj4gPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21mZC9yZW5lc2FzLXZiYXR0Yi5jDQo+
ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9LY29uZmlnIGIvZHJpdmVycy9tZmQv
S2NvbmZpZyBpbmRleA0KPiA+PiBiYzhiZTJlNTkzYjYuLmRmOTNlOGIwNTA2NSAxMDA2NDQNCj4g
Pj4gLS0tIGEvZHJpdmVycy9tZmQvS2NvbmZpZw0KPiA+PiArKysgYi9kcml2ZXJzL21mZC9LY29u
ZmlnDQo+ID4+IEBAIC0xMzgzLDYgKzEzODMsMTQgQEAgY29uZmlnIE1GRF9TQzI3WFhfUE1JQw0K
PiA+PiAgCSAgVGhpcyBkcml2ZXIgcHJvdmlkZXMgY29tbW9uIHN1cHBvcnQgZm9yIGFjY2Vzc2lu
ZyB0aGUgU0MyN3h4IFBNSUNzLA0KPiA+PiAgCSAgYW5kIGl0IGFsc28gYWRkcyB0aGUgaXJxX2No
aXAgcGFydHMgZm9yIGhhbmRsaW5nIHRoZSBQTUlDIGNoaXANCj4gZXZlbnRzLg0KPiA+Pg0KPiA+
PiArY29uZmlnIE1GRF9SRU5FU0FTX1ZCQVRUQg0KPiA+PiArCXRyaXN0YXRlICJSZW5lc2FzIFZC
QVRUQiBkcml2ZXIiDQo+ID4+ICsJZGVwZW5kcyBvbiAoQVJDSF9SWkcyTCAmJiBPRikgfHwgQ09N
UElMRV9URVNUDQo+ID4+ICsJc2VsZWN0IE1GRF9DT1JFDQo+ID4+ICsJaGVscA0KPiA+PiArCSAg
U2VsZWN0IHRoaXMgb3B0aW9uIHRvIGVuYWJsZSBSZW5lc2FzIFJaL0czUyBWQkFUVEIgZHJpdmVy
IHdoaWNoDQo+ID4+ICsJICBwcm92aWRlcyBzdXBwb3J0IGZvciB0aGUgUlRDIGNsb2NrLCB0YW1w
ZXIgZGV0ZWN0b3IgYW5kIDEyOEIgU1JBTS4NCj4gPj4gKw0KPiA+PiAgY29uZmlnIFJaX01UVTMN
Cj4gPj4gIAl0cmlzdGF0ZSAiUmVuZXNhcyBSWi9HMkwgTVRVM2EgY29yZSBkcml2ZXIiDQo+ID4+
ICAJZGVwZW5kcyBvbiAoQVJDSF9SWkcyTCAmJiBPRikgfHwgQ09NUElMRV9URVNUIGRpZmYgLS1n
aXQNCj4gPj4gYS9kcml2ZXJzL21mZC9NYWtlZmlsZSBiL2RyaXZlcnMvbWZkL01ha2VmaWxlIGlu
ZGV4DQo+ID4+IDAyYjY1MWNkNzUzNS4uY2QyZjI3NDkyZGYyIDEwMDY0NA0KPiA+PiAtLS0gYS9k
cml2ZXJzL21mZC9NYWtlZmlsZQ0KPiA+PiArKysgYi9kcml2ZXJzL21mZC9NYWtlZmlsZQ0KPiA+
PiBAQCAtMTg2LDYgKzE4Niw3IEBAIHBjZjUwNjMzLW9ianMJCQk6PSBwY2Y1MDYzMy1jb3JlLm8N
Cj4gcGNmNTA2MzMtaXJxLm8NCj4gPj4gIG9iai0kKENPTkZJR19NRkRfUENGNTA2MzMpCSs9IHBj
ZjUwNjMzLm8NCj4gPj4gIG9iai0kKENPTkZJR19QQ0Y1MDYzM19BREMpCSs9IHBjZjUwNjMzLWFk
Yy5vDQo+ID4+ICBvYmotJChDT05GSUdfUENGNTA2MzNfR1BJTykJKz0gcGNmNTA2MzMtZ3Bpby5v
DQo+ID4+ICtvYmotJChDT05GSUdfTUZEX1JFTkVTQVNfVkJBVFRCKQkrPSByZW5lc2FzLXZiYXR0
Yi5vDQo+ID4+ICBvYmotJChDT05GSUdfUlpfTVRVMykJCSs9IHJ6LW10dTMubw0KPiA+PiAgb2Jq
LSQoQ09ORklHX0FCWDUwMF9DT1JFKQkrPSBhYng1MDAtY29yZS5vDQo+ID4+ICBvYmotJChDT05G
SUdfTUZEX0RCODUwMF9QUkNNVSkJKz0gZGI4NTAwLXByY211Lm8NCj4gPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbWZkL3JlbmVzYXMtdmJhdHRiLmMNCj4gPj4gYi9kcml2ZXJzL21mZC9yZW5lc2Fz
LXZiYXR0Yi5jIG5ldyBmaWxlIG1vZGUgMTAwNjQ0IGluZGV4DQo+ID4+IDAwMDAwMDAwMDAwMC4u
NWQ3MTU2NWI4Y2JmDQo+ID4+IC0tLSAvZGV2L251bGwNCj4gPj4gKysrIGIvZHJpdmVycy9tZmQv
cmVuZXNhcy12YmF0dGIuYw0KPiA+PiBAQCAtMCwwICsxLDc4IEBADQo+ID4+ICsvLyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+PiArLyoNCj4gPj4gKyAqIFZCQVRUQiBkcml2
ZXINCj4gPj4gKyAqDQo+ID4+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjQgUmVuZXNhcyBFbGVjdHJv
bmljcyBDb3JwLg0KPiA+PiArICovDQo+ID4+ICsNCj4gPj4gKyNpbmNsdWRlIDxsaW51eC9tb2Rf
ZGV2aWNldGFibGUuaD4NCj4gPj4gKyNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPg0KPiA+
PiArI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiA+PiArI2luY2x1ZGUgPGxp
bnV4L3BtX3J1bnRpbWUuaD4NCj4gPj4gKyNpbmNsdWRlIDxsaW51eC9yZXNldC5oPg0KPiA+PiAr
DQo+ID4+ICtzdGF0aWMgaW50IHZiYXR0Yl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KSB7DQo+ID4+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4gPj4gKwlz
dHJ1Y3QgcmVzZXRfY29udHJvbCAqcnN0YzsNCj4gPj4gKwlpbnQgcmV0Ow0KPiA+PiArDQo+ID4+
ICsJcnN0YyA9IGRldm1fcmVzZXRfY29udHJvbF9hcnJheV9nZXRfZXhjbHVzaXZlKGRldik7DQo+
ID4+ICsJaWYgKElTX0VSUihyc3RjKSkNCj4gPj4gKwkJcmV0dXJuIFBUUl9FUlIocnN0Yyk7DQo+
ID4+ICsNCj4gPj4gKwlyZXQgPSBkZXZtX3BtX3J1bnRpbWVfZW5hYmxlKGRldik7DQo+ID4+ICsJ
aWYgKHJldCkNCj4gPj4gKwkJcmV0dXJuIHJldDsNCj4gPj4gKw0KPiA+PiArCXJldCA9IHBtX3J1
bnRpbWVfcmVzdW1lX2FuZF9nZXQoZGV2KTsNCj4gPj4gKwlpZiAocmV0KQ0KPiA+PiArCQlyZXR1
cm4gcmV0Ow0KPiA+DQo+ID4gTWF5YmUgYXMgYW4gb3B0aW1pemF0aW9uIGRyb3AgcG0gY2FsbHMg
YW5kIHVzZSAiZGV2bV9jbGtfZ2V0X2VuYWJsZWQiDQo+ID4gaW5zdGVhZCBhcyBpdCBwZXJmZWN0
bHkgZml0cyBpbiB0aGlzIHNjZW5hcmlvPz8NCj4gDQo+IFZCQVRUQiBpcyBzdGlsbCBwYXJ0IG9m
IGEgUE0gZG9tYWluLiBUaGF0IG5lZWRzIHRvIGJlIGVuYWJsZWQgYXMgd2VsbC4NCj4gcG1fcnVu
dGltZV8qIEFQSXMgdGFrZXMgY2FyZSBvZiBib3RoIGNsb2NrIGVuYWJsZSBhbmQgcG93ZXIgZG9t
YWluIG9uDQo+IG9wZXJhdGlvbnMuDQo+IA0KPiBPbmUgdGhpbmcgdG8gbm90aWNlIGlzIHRoYXQg
b24gUlovRzNTIHRoZSBWQkFUVEIgY2xvY2sgaXMgQ1JJVElDQUwgKHRodXMNCj4gZW5hYmxlZCBp
biB0aGUgcHJvYmUgb2YgdGhlIGNsb2NrIGRyaXZlciksIHRoZSBQTSBkb21haW4gaXMgYWx3YXlz
IE9OIChhbmQNCj4gYWxzbyBlbmFibGVkIGJ5IGNsb2NrIGRyaXZlcikuIFdlIGNhbiBnZXQgcmlk
IG9mIHBtX3J1bnRpbWVfKiBhdCBhbGwgZm9yDQo+IFJaL0czUyBidXQgSSB0aGluayBpdCB3b3Vs
ZCBiZSBiZXR0ZXIgdG8gaGF2ZSBpdCBoZXJlIGFzIHdlbGwgZm9yIGZ1dHVyZQ0KPiBwbGF0Zm9y
bXMgYW5kIHRvIGVtcGhhc2l6ZSBmcm9tIGRyaXZlciB0aGF0IHRoZXNlIHJlc291cmNlcyBhcmUg
bmVlZGVkIGJ5DQo+IHRoZSBWQkFUVEIuIFRoZSBzYW1lIGFwcHJvYWNoIGlzIHVzZWQgZm9yICBv
dGhlciBSWi9HMiBkcml2ZXJzIHRoYXQNCj4gZGVjbGFyZXMgY3JpdGljYWwgY2xvY2tzL2Fsd2F5
cy1vbiBkb21haW5zIChlLmcuIGRtYSBkcml2ZXIsIElBNTUgZHJpdmVyKS4NCg0KDQpJZiBpdCBp
cyBjcml0aWNhbCBjbG9jaywgdGhlIHBhcmVudCBoYXMgdG8gYmUgY3JpdGljYWwgY2xvY2suIFNv
IHlvdSBjYW4gYmxpbmRseQ0KdXNlIGRldm1fY2xrX2dldF9lbmFibGVkKCkgdGhhdCBzaW1wbGlm
aWVzIHByb2JlKCksIGlmIHRoZSBQTSBkb21haW4gY29udHJvbHMgb25seSBjbG9jay4NCg0KDQpJ
ZiB0aGUgUE0gZG9tYWluIGNvbnRyb2xzIHZvbHRhZ2UgbWVhbnMgeW91IHNob3VsZCB1c2UgUE0g
ZG9tYWluIEFQSXMNCg0KQ2hlZXJzLA0KQmlqdQ0KDQo=

