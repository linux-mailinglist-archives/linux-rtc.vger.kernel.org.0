Return-Path: <linux-rtc+bounces-1843-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F7496961C
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 09:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3ACC284E22
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 07:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022E520012B;
	Tue,  3 Sep 2024 07:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="r/EZMqc/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011046.outbound.protection.outlook.com [52.101.125.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D05E1D6DCE;
	Tue,  3 Sep 2024 07:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725349908; cv=fail; b=qLVEPFN2zP1H7YpNQocbtZKg8j5QCPKz1WlVuCdaxT1pH3XdEutfBa135q/I5f2zLSWRZtdKiOp8PXkA23+ms7PH/P/hAzsh+nv3z//tcDPfx+DcqQgCc6+UnAcnAh0CuP9O1TMGG2soYhH0470G+rTu3iP0adVlsjuvJtMR8iI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725349908; c=relaxed/simple;
	bh=VjDs/VEpfcqdGB0mI9W1oIIghihG9Fmr/SJsBq9ngQk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DaUE9gkEeRZtdrYjQME/pibQ+E1949rTJ0IUVjqsU5IMmyabENoOKbzRxWStpDxBMZrLp6n0Wz8dTDAb2B65uR557I4tIaaKRcjKroLF33KmCNZWAwuYyix03Ut1Y9KR/rG5NzaCEE1X5dkUCTMR5RJUWRMO/EWA5mwB+nneovY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=r/EZMqc/; arc=fail smtp.client-ip=52.101.125.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9egE26Jz2jFFKZtkxKmLeNhHeoOZsjKu/8J621pm24gTuoAksHBvX30flm0Q3mA+7goZs+nmyftXSkQRldOGLQuHbTBH+W16Nx3ZXw2LkY19ttWxPqnFrmKfJ7sN+62MMbkTMaFS+Ub9JaaPYWhd2tX02kqX5Ii2l+FrdDHbndsFSx1RmKQ86lLhjK6wabWyF5RzxeEe6hnhdtVfBEXtvEibVyz3JU3ST12X8B/Ii7x6olac+tdJQevYmPOaDLNorvaVVvSD9j+5QZwNzAPBynYVxpIqgH81KXa5SI/7pP+USQKtlsoubqGFuIYfcgpaHLqExWE6FlejPcP+jOpuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjDs/VEpfcqdGB0mI9W1oIIghihG9Fmr/SJsBq9ngQk=;
 b=JKDzOe/sXQPO6pO96dOigsf5ZzaJSkdi1DJHQ9qBVhuvdijx58A6cFWiDKLvDrLegTRdK8QPP1GCxxx6w3XvfvB+bZ/5I29TDRfk5eq7wduiMa2PHoXx8cu4sc7K2q/jyvNzWiiR5aFeIDhaKEqjL+dUmKh+92LQjB5nzPUvDpBRqi2Eo0EU16w8fnHpXv5UFl+Q0rBMkhaErsSbMVerZZ8gB07i5mt3IUSSxFuanzTzhKJZSYv/wimiF2p/qaA15BIOZhyPeJcxKe/61OfGcL3ALh4VHdATuFhOVx8ZbwuEV9qdyyb/ZCzRt4/VTXzqxA7306qfnyabO2WKhqWCqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjDs/VEpfcqdGB0mI9W1oIIghihG9Fmr/SJsBq9ngQk=;
 b=r/EZMqc/HSsJykwkSPrqiZPyZ8G0O5Fnu7ZrW5r/QhB12wbvtpTZjSZ2/fgETsdVp167vPgy90YLnPA+XaXiSDZW3Zqhfica6koiO7nKFXPLwtBRfrQgcQxwWij57cXjIRr89Hjnajp1t2SaxRGcGoCLcV41AVDN3s7540PPFSw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB6568.jpnprd01.prod.outlook.com (2603:1096:604:fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 07:51:38 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 07:51:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v3 01/12] dt-bindings: clock: renesas,r9a08g045-vbattb:
 Document VBATTB
Thread-Topic: [PATCH v3 01/12] dt-bindings: clock: renesas,r9a08g045-vbattb:
 Document VBATTB
Thread-Index: AQHa+tztyXN6WBwX60SzraGfzO2XvrJFpXxQgAAKhwCAAAGFsIAAAuwAgAAAcJA=
Date: Tue, 3 Sep 2024 07:51:38 +0000
Message-ID:
 <TY3PR01MB11346B4182AE20B616C36A10786932@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-2-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346D59E486D88611E8F254F86932@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <54d60105-ee5b-48da-92f4-2bcb3dff5c92@tuxon.dev>
 <TY3PR01MB11346F4625C5C7D321490306E86932@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <a1a665b9-05f1-43a8-88bc-2701cdd0e4ee@tuxon.dev>
In-Reply-To: <a1a665b9-05f1-43a8-88bc-2701cdd0e4ee@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB6568:EE_
x-ms-office365-filtering-correlation-id: 176882ec-110d-4fab-e5f1-08dccbed3dbf
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q3RGMnRCYXFlTmVWaTNjdEQyMk5naHk1SzJ4N1VqMVZFZVlQdFIybkxydlJ5?=
 =?utf-8?B?LzZiZm8rblV1SzJPcUI3Vy9UWjBEaE1sYm5uMTR0T0ZRWVJiVFNUOVJBUnAy?=
 =?utf-8?B?K1hUTXdta0hCZEFCZUN6QXZVTEJ6YWRkSlllTENVSmZnYU1zdklNbmtKb0Q1?=
 =?utf-8?B?Y1lMOHE1NEZkbHJSUllTWDh1RVVDZEhoaDU1T1ZwWDBBQlN6cUNqdXN1S2p4?=
 =?utf-8?B?WFJIYi9zbmt6by9aVHZJOFdpYXkxMnZvMzV6eHhBdFl3UWVOSDNTTHZKMXFL?=
 =?utf-8?B?bUdaaUdsMmlydWV3MTJwRXhMeHZwSno4NjFTeGx4WWVueHdLV2RpRnpISmcx?=
 =?utf-8?B?dStqeCs5TnVpcGNMbE9BdEhBNm1WRVBFZ0dWL0IvVkdsUnpOb2d1bmRzMXIv?=
 =?utf-8?B?MHJoZ3dXc2tSZU5rckxYY3FLZzRCeGRnUHNoc2VHQnMzV3gzam5nRC95SWRJ?=
 =?utf-8?B?QThRZjNiRVJaT2J1WVpxRnlsdU5FWGFnd0hCdC80OEovMmlhR2FmeWdETzl2?=
 =?utf-8?B?M3dEelJjdWZKMlIyUk5GTWNXRHBwN29DUmZCdHJVQW1kV2gzY1BmazJ0NHZB?=
 =?utf-8?B?cWNibUJnTXFmSDg5NUpRL2tLakJBeE8zaVV2M2dQUm9sR2l1dmdwVSttT0t5?=
 =?utf-8?B?UmtTWGFiMTg3WDM2MGJTakgrRHVsalRTRTBHeG9YTWNJbWRJNTNWSWRMZ3hH?=
 =?utf-8?B?UmpnTVN4S3ZJaEV3Tm5xVmNaUnNUNUhtNnVlZG44ZHBVcU9SVWtqTnZxbEhU?=
 =?utf-8?B?NVJKeEVzS1liblJWQnhMVGpMV1V1RWFVc3RQRlFjdFBvN2FYYTZudlhJQzdP?=
 =?utf-8?B?eXpXZm5XQ0dsbXYzeXJPZFp5cXVvNU13YmRrUmp1UFBjQWlmQUZzdVExaURV?=
 =?utf-8?B?ZFVZc25nNzZLWEhTSXJ3TEp3WFJUWklLSFZxM2t4SFFtSFVMaERsUnUwU3du?=
 =?utf-8?B?R05iK1d2M09hS01JcVJaa0FpTko5M25JdU5SZU1qSVhRVXIyS01ZZE1nUHFu?=
 =?utf-8?B?YUd6SGYwNjhQcDdFNkVqNEo2VkhoY1gwRVBCd2UybkxNVEZmUXczTWxiUFo0?=
 =?utf-8?B?RHZyL1d3a1FUQ0M3clA5a1hrdncrdGhIQ252aHhZT21WeDh0WCtWbDFBK0JK?=
 =?utf-8?B?YUd0elZ0NmR0bmg3TWk0Z1M1bGtXM1dPcEtRTFFCU1ZDQjNlU0kzZTdjK1dr?=
 =?utf-8?B?SUt0NUM0MmRKL29iMHB4MFRqWTRPeGhqVU1ZVFdJMWhpSDRmSHhaaERobXB1?=
 =?utf-8?B?QWtLZ3E1Q2w0QitSd1RHWVFaS0R2ZEZ6bUdzYjZqVk5uWGJkT1JnSmwwRFNS?=
 =?utf-8?B?QWx4WlkwMGNQaXVlZkRmMTI3V3o5YkY1aDZtd00zZjQxY2VXUHYzZnpnaWtw?=
 =?utf-8?B?cUlCUWFtc1dDbjdGMElCcHpCZ3lzcDFLbWVMSVF4a25aL3B5RXpwck94WmFu?=
 =?utf-8?B?SnRIRVFaNmwxdmJONkEwZ3MzNEFIa1FESUdIQUJDYXpyd1ZjNjB6NU1tZFhD?=
 =?utf-8?B?OU9SU0R5VnRMTllVbDMvemhIUEUwM0trbzJaNU5RaWxWbkg5TFdHVFBDZDlN?=
 =?utf-8?B?Q0tGaTBVZ3gvblVZRmJxL1BZOHh3OWt1Mi8xTng0NnFPVFByY0QrV1ovZG55?=
 =?utf-8?B?VmI2c1RJUkVnR1h5WTRVdG1vRm40dzFMRFJDTDdTbVE4R3hHZXpBY0Y3NU1r?=
 =?utf-8?B?UXhSaFZmamljVzVvQTVYZnF1QzVYK1c5QmRHUC9rWE4wNzhWZXpCK0U3TzlD?=
 =?utf-8?B?bGk0c00yWTJRcmhrWlkxRWlBWFludlFJdmRYV3M2Z0lOQUc3aVNNLzV3elh5?=
 =?utf-8?B?RmFSMHdGQzgyWEMzakFVaHB6UFdJL3ZacU52cHdSbjBMSmV4NFdMSjZ1YTQ2?=
 =?utf-8?Q?vrWoW2u5Dz7O0?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c28rUWFwZU00K0xFYzlxKzFjVEs2bDlPNmJ4UFA0WjFkUVBIeDhiOTJWUmZU?=
 =?utf-8?B?SExmU1RYWnlmYVdhWkdxd2JYWS9rcU5ndHJMSTBsaWV3c1dNcE13Y0RydmpZ?=
 =?utf-8?B?cml6U1hIY3lQU2VPd3BBZE4vOS9KeFRMVnVsTXlSNVBQS2RhQ3pBazNPdmVP?=
 =?utf-8?B?aHBnaVEzT05RR3RhUzBsS3hQNnBuQ3ZMTEJERlFhOVVic2VsdzVpM1RxbElh?=
 =?utf-8?B?d2xvdEpHcEhlLzBCRzRSQlF5NWViczZRNTBGMS9yM1hqbSszVGlPYkt1eUx1?=
 =?utf-8?B?NGNyRFhpZ3EyNFFMa1dXWmFUKzVBb3FOV0pjNFlIS0Iwd0hnbEhKRmhvZy9N?=
 =?utf-8?B?dHEwbU5MdWdscWJFb3k3ZnZwOENEMW1oY0tsL1RBOWE1TlF6VmJZVHUwQVAz?=
 =?utf-8?B?SzA1TVRuNHVMWUovbVE5RUJ1M3VlUVZ5MjBWMTBtRVd4S3p3TklUMlMyTWdj?=
 =?utf-8?B?dk1XUndoeVU5amQvZXFpWlRVT0lmcCt6blhuQk9RaGJKNG5vSjdXVGMvS0ZN?=
 =?utf-8?B?YzdtU1kyVDRKSnJYdE81QXlDUmxWQnV4RHJkdm5reTBsZ1U5MWVpN0FQKy81?=
 =?utf-8?B?blVyNTdIVHlFQnVsbWRITmhzRWc0TEUzN1A0TisvTXI0ZzRlcXc5dk1Tak5C?=
 =?utf-8?B?KzNHcG93bUJ1ZEVoUjBRRzQvMG9vcHgwWnJUUXNVTy93YnRmM1hBSEwxVmdp?=
 =?utf-8?B?NlRLMElRcUhpZFAybk9FV29vZVoxNTJ1S3o0dUo1eHNWQ3o1NGJFVit0OUJC?=
 =?utf-8?B?OFNBZk9UNld4cEhEMFFVRFI1ZnJPaXM4TDE3b3hwdWFIZUp2VHNDdXlBQURw?=
 =?utf-8?B?Tzd4Z3JidEw2L2JiVk4zVUJtOHp4cWpmdUt3M05QNkl0SFBsNnplZzRxc3Bh?=
 =?utf-8?B?L2h4RG1Wa09EcjRHR05zRmxCYTJrcGVRc2FldUN1UlUvQ1FPaFFiVXJkazBC?=
 =?utf-8?B?M1AzTFQyUXJaL0R5K291NXhHQnlNRExpQzIzRFh1dVZPUHkrbUFtb3lJNURW?=
 =?utf-8?B?aTdDMmd3MmFYdTZBWUR2OWQxUjg1YkdOaHlLYzhuMWxXTUNsRDBMSXhnMzBs?=
 =?utf-8?B?ZjFUSXpnYzFoOEhtR2d5MnBmOWtWbWZ6WmlTVU9Lckp2dUExRVhmcXh0anhI?=
 =?utf-8?B?dGJHSy9jTzdaY05QMTFYTWV0R2dPd3BydytXbUo4b3NBTk5QVHZlQm4vcmNq?=
 =?utf-8?B?Wk1kMUVYTnR1akVaQVJvRzJwaDdIVXZOcEpVSnlTdEJYYTVFMjZ6Vlk4VmQ1?=
 =?utf-8?B?YUFmMnF5MUorS0gxOUR3dk5Od0U5Vkwva0p6dlZmQXpJL1ZLbGJtc1FlY25a?=
 =?utf-8?B?enBWRUdBaDlkdjVzRUpGems1ZlpiZ2VsUzc2TUhMaEFhMlk1TGN4M3BIV2tw?=
 =?utf-8?B?KzFCd3lkalBSM1E4aUN2WmtEUnZvME9yM1BPV0JOSGFkdHJRZFdNNWNSZUU5?=
 =?utf-8?B?S0FXbW9GSENNNlZXdmt3cWNqK3pCM056SkRRejZLS2h3WHdxdStaUyt4Z0tr?=
 =?utf-8?B?S0p3Zzdna1Y5UDJsTStHQ1ZBaGxWMGhGYS9GY3BzZUxWdDhXTkRTWDArYUJP?=
 =?utf-8?B?ejl1MmVXcTBBSnE2U3UzUTRadmdWWnlrNGlVZC9EK0xUMElEMVlmVDlBbGRs?=
 =?utf-8?B?QTY3K0UwN3hobHZtRFJqVk9XeFhOc0F3d09UWnlGQ0ozU2xuRytIVjZxZkNK?=
 =?utf-8?B?V25raExjUWdOclZwcnR6ZE41bDZLeG5PRVoxajgvYmZUM1dsazYyWkhHRi9s?=
 =?utf-8?B?MjNrUkhjWFc1eVp1S2U5U1kwenFjcDNqa0ljbndTTXhtTmsvSXBjSWo2VmhI?=
 =?utf-8?B?QncrVS85b1FvWXFFUjFyenJ5bDhnYlM1OHJXQ1RhZzRZejV0c0EyNXlxRm5Y?=
 =?utf-8?B?clNBcmg4WFVRTk8xRmtZTXVBUC9iR0ZjUzdtOG1lUlJ3RkVJaTdPUEZlSG5l?=
 =?utf-8?B?ZDgrT2YyYjgvMis1N0p4YkxBQUVJaGZZcm5lWGw1UEJlalhCM2NyQmZ1UEpF?=
 =?utf-8?B?L282K2RsVXdkZSswT0Nmc1dVbVFFdVVjMGVlNkNJSEZuNTJqdVd2ZW5RTXFH?=
 =?utf-8?B?TkdVTW05TU5uWi9RaG03aU4wM0RSNUZUcEdNY2txSFllbWNLL2RXUVRxTWQz?=
 =?utf-8?B?U3VLVjNKUXRUR1BTYU41czVKSGcrekgwcEY0aUV6aDFzS0lJei9Pc0RxY1g1?=
 =?utf-8?B?bGc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 176882ec-110d-4fab-e5f1-08dccbed3dbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 07:51:38.3310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jVhhwn+A6C6n4tlZQAChgzYsLpKL6EplXhX1ELIL25Vv+SX2MPnQRc/BDsxDXsSeATCnXbar+X/Bb68v7GtotFqatTe4Cv94e0L+h2+YJZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6568

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBjbGF1
ZGl1IGJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiBUdWVzZGF5LCBT
ZXB0ZW1iZXIgMywgMjAyNCA4OjQ0IEFNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMDEvMTJd
IGR0LWJpbmRpbmdzOiBjbG9jazogcmVuZXNhcyxyOWEwOGcwNDUtdmJhdHRiOiBEb2N1bWVudCBW
QkFUVEINCj4gDQo+IA0KPiANCj4gT24gMDMuMDkuMjAyNCAxMDozNiwgQmlqdSBEYXMgd3JvdGU6
DQo+ID4gSGkgQ2xhdWRpdSwNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+PiBGcm9tOiBjbGF1ZGl1IGJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiA+
PiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgMywgMjAyNCA4OjI4IEFNDQo+ID4+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjMgMDEvMTJdIGR0LWJpbmRpbmdzOiBjbG9jazoNCj4gPj4gcmVuZXNhcyxy
OWEwOGcwNDUtdmJhdHRiOiBEb2N1bWVudCBWQkFUVEINCj4gPj4NCj4gPj4NCj4gPj4NCj4gPj4g
T24gMDMuMDkuMjAyNCAwOTo1OCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4+PiBIaSBDbGF1ZGl1LA0K
PiA+Pj4NCj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IENs
YXVkaXUgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gPj4+PiBTZW50OiBGcmlkYXksIEF1
Z3VzdCAzMCwgMjAyNCAyOjAyIFBNDQo+ID4+Pj4gU3ViamVjdDogW1BBVENIIHYzIDAxLzEyXSBk
dC1iaW5kaW5nczogY2xvY2s6DQo+ID4+Pj4gcmVuZXNhcyxyOWEwOGcwNDUtdmJhdHRiOiBEb2N1
bWVudCBWQkFUVEINCj4gPj4+Pg0KPiA+Pj4+IEZyb206IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1
LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4NCj4gPj4+Pg0KPiA+Pj4+IFRoZSBWQkFUVEIgSVAg
b2YgdGhlIFJlbmVzYXMgUlovRzNTIFNvQyBjb250cm9scyB0aGUgY2xvY2sgZm9yIFJUQywNCj4g
Pj4+PiB0aGUgdGFtcGVyIGRldGVjdG9yIGFuZCBhIHNtYWxsIGdlbmVyYWwgdXNhZ2UgbWVtb3J5
IG9mIDEyOEIuIEFkZCBkb2N1bWVudGF0aW9uIGZvciBpdC4NCj4gPj4+Pg0KPiA+Pj4+IFNpZ25l
ZC1vZmYtYnk6IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNv
bT4NCj4gPj4+PiAtLS0NCj4gPj4+Pg0KPiA+Pj4+IENoYW5nZXMgaW4gdjM6DQo+ID4+Pj4gLSBt
b3ZlZCB0aGUgZmlsZSB0byBjbG9jayBkdCBiaW5kaW5ncyBkaXJlY3RvcnkgYXMgaXQgaXMgdGhl
DQo+ID4+Pj4gICBvbmx5IGZ1bmN0aW9uYWxpdHkgc3VwcG9ydGVkIGF0IHRoZSBtb21lbnQ7IHRo
ZSBvdGhlciBmdW5jdGlvbmFsaXRpZXMNCj4gPj4+PiAgICh0YW1wZXIgZGV0ZWN0b3IsIFNSQU0p
IGFyZSBvZmZlcmVkIHRob3VnaCByZWdpc3RlciBzcHJlYWRlZA0KPiA+Pj4+ICAgdGhvdWdoIHRo
ZSBhZGRyZXNzIHNwYWNlIG9mIHRoZSBWQkFUVEIgSVAgYW5kIG5vdCBhY3R1YWxseQ0KPiA+Pj4+
ICAgaW5kaXZpZHVhbCBkZXZpY2VzOyB0aGUgb3RoZXIgZnVuY3Rpb25hbGl0aWVzIGFyZSBub3QN
Cj4gPj4+PiAgIHBsYW5uZWQgdG8gYmUgc3VwcG9ydGVkIHNvb24gYW5kIGlmIHRoZXkgd2lsbCBi
ZSBJIHRoaW5rIHRoZXkNCj4gPj4+PiAgIGZpdCBiZXR0ZXIgb24gYXV4aWxpYXJ5IGJ1cyB0aGFu
IE1GRA0KPiA+Pj4+IC0gZHJvcHBlZCBpbnRlcnJ1cHQgbmFtZXMgYXMgcmVxdWVzdGVkIGluIHRo
ZSByZXZpZXcgcHJvY2Vzcw0KPiA+Pj4+IC0gZHJvcHBlZCB0aGUgaW5uZXIgbm9kZSBmb3IgY2xv
Y2sgY29udHJvbGxlcg0KPiA+Pj4+IC0gYWRkZWQgI2Nsb2NrLWNlbGxzDQo+ID4+Pj4gLSBhZGRl
ZCBydHggY2xvY2sNCj4gPj4+PiAtIHVwZGF0ZWQgZGVzY3JpcHRpb24gZm9yIHJlbmVzYXMsdmJh
dHRiLWxvYWQtbmFub2ZhcmFkcw0KPiA+Pj4+IC0gaW5jbHVkZWQgZHQtYmluZGluZ3MvaW50ZXJy
dXB0LWNvbnRyb2xsZXIvaXJxLmggaW4gZXhhbXBsZXMNCj4gPj4+PiBzZWN0aW9uDQo+ID4+Pj4N
Cj4gPj4+PiBDaGFuZ2VzIGluIHYyOg0KPiA+Pj4+IC0gY2hhbmdlZCBmaWxlIG5hbWUgYW5kIGNv
bXBhdGlibGUNCj4gPj4+PiAtIHVwZGF0ZWQgdGl0bGUsIGRlc2NyaXB0aW9uIHNlY3Rpb25zDQo+
ID4+Pj4gLSBhZGRlZCBjbG9jayBjb250cm9sbGVyIHBhcnQgZG9jdW1lbnRhdGlvbiBhbmQgZHJv
cCBkZWRpY2F0ZWQgZmlsZQ0KPiA+Pj4+ICAgZm9yIGl0IGluY2x1ZGVkIGluIHYxDQo+ID4+Pj4g
LSB1c2VkIGl0ZW1zIHRvIGRlc2NyaWJlIGludGVycnVwdHMsIGludGVycnVwdC1uYW1lcywgY2xv
Y2tzLCBjbG9jay1uYW1lcywNCj4gPj4+PiAgIHJlc2V0cw0KPiA+Pj4+IC0gZHJvcHBlZCBub2Rl
IGxhYmVscyBhbmQgc3RhdHVzDQo+ID4+Pj4gLSB1cGRhdGVkIGNsb2NrLW5hbWVzIGZvciBjbG9j
ayBjb250cm9sbGVyIHRvIGNvcGUgd2l0aCB0aGUgbmV3DQo+ID4+Pj4gICBsb2dpYyBvbiBkZXRl
Y3RpbmcgdGhlIG5lY2Vzc2l0eSB0byBzZXR1cCBieXBhc3MNCj4gPj4+Pg0KPiA+Pj4+ICAuLi4v
Y2xvY2svcmVuZXNhcyxyOWEwOGcwNDUtdmJhdHRiLnlhbWwgICAgICAgfCA4MSArKysrKysrKysr
KysrKysrKysrDQo+ID4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA4MSBpbnNlcnRpb25zKCspDQo+ID4+
Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+Pj4+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9jbG9jay9yZW5lc2FzLHI5YTA4ZzA0NS12YmF0dGIueWENCj4gPj4+PiBtbA0KPiA+
Pj4+DQo+ID4+Pj4gZGlmZiAtLWdpdA0KPiA+Pj4+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Nsb2NrL3JlbmVzYXMscjlhMDhnMDQ1LXZiYXR0Yi4NCj4gPj4+PiB5YQ0KPiA+
Pj4+IG1sDQo+ID4+Pj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2sv
cmVuZXNhcyxyOWEwOGcwNDUtdmJhdHRiLg0KPiA+Pj4+IHlhDQo+ID4+Pj4gbWwNCj4gPj4+PiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uMjlkZjBlMDFm
YWU1DQo+ID4+Pj4gLS0tIC9kZXYvbnVsbA0KPiA+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9jbG9jay9yZW5lc2FzLHI5YTA4ZzA0NS12YmENCj4gPj4+PiArKysg
dHQNCj4gPj4+PiArKysgYi55DQo+ID4+Pj4gKysrIGFtbA0KPiA+Pj4+IEBAIC0wLDAgKzEsODEg
QEANCj4gPj4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBC
U0QtMi1DbGF1c2UpICVZQU1MDQo+ID4+Pj4gKzEuMg0KPiA+Pj4+ICstLS0NCj4gPj4+PiArJGlk
Og0KPiA+Pj4+ICtodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9jbG9jay9yZW5lc2FzLHI5
YTA4ZzA0NS12YmF0dGIueWFtbCMNCj4gPj4+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUu
b3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4+Pj4gKw0KPiA+Pj4+ICt0aXRsZTogUmVu
ZXNhcyBCYXR0ZXJ5IEJhY2t1cCBGdW5jdGlvbiAoVkJBVFRCKQ0KPiA+Pj4+ICsNCj4gPj4+PiAr
ZGVzY3JpcHRpb246DQo+ID4+Pj4gKyAgUmVuZXNhcyBWQkFUVEIgaXMgYW4gYWx3YXlzIG9uIHBv
d2VyZWQgbW9kdWxlIChiYWNrZWQgYnkNCj4gPj4+PiArYmF0dGVyeSkgd2hpY2gNCj4gPj4+PiAr
ICBjb250cm9scyB0aGUgUlRDIGNsb2NrIChWQkFUVENMSyksIHRhbXBlciBkZXRlY3Rpb24gbG9n
aWMgYW5kIGENCj4gPj4+PiArc21hbGwNCj4gPj4+PiArICBnZW5lcmFsIHVzYWdlIG1lbW9yeSAo
MTI4QikuDQo+ID4+Pj4gKw0KPiA+Pj4+ICttYWludGFpbmVyczoNCj4gPj4+PiArICAtIENsYXVk
aXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4NCj4gPj4+PiArDQo+
ID4+Pj4gK3Byb3BlcnRpZXM6DQo+ID4+Pj4gKyAgY29tcGF0aWJsZToNCj4gPj4+PiArICAgIGNv
bnN0OiByZW5lc2FzLHI5YTA4ZzA0NS12YmF0dGINCj4gPj4+PiArDQo+ID4+Pj4gKyAgcmVnOg0K
PiA+Pj4+ICsgICAgbWF4SXRlbXM6IDENCj4gPj4+PiArDQo+ID4+Pj4gKyAgaW50ZXJydXB0czoN
Cj4gPj4+PiArICAgIGl0ZW1zOg0KPiA+Pj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiB0YW1wZXIg
ZGV0ZWN0b3IgaW50ZXJydXB0DQo+ID4+Pj4gKw0KPiA+Pj4+ICsgIGNsb2NrczoNCj4gPj4+PiAr
ICAgIGl0ZW1zOg0KPiA+Pj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBWQkFUVEIgbW9kdWxlIGNs
b2NrDQo+ID4+Pj4gKyAgICAgIC0gZGVzY3JpcHRpb246IFJUQyBpbnB1dCBjbG9jayAoY3J5c3Rh
bCBvc2NpbGxhdG9yIG9yDQo+ID4+Pj4gKyBleHRlcm5hbCBjbG9jayBkZXZpY2UpDQo+ID4+Pj4g
Kw0KPiA+Pj4+ICsgIGNsb2NrLW5hbWVzOg0KPiA+Pj4+ICsgICAgaXRlbXM6DQo+ID4+Pj4gKyAg
ICAgIC0gY29uc3Q6IGJjbGsNCj4gPj4+PiArICAgICAgLSBjb25zdDogcnR4DQo+ID4+Pj4gKw0K
PiA+Pj4+ICsgICcjY2xvY2stY2VsbHMnOg0KPiA+Pj4+ICsgICAgY29uc3Q6IDENCj4gPj4+PiAr
DQo+ID4+Pj4gKyAgcG93ZXItZG9tYWluczoNCj4gPj4+PiArICAgIG1heEl0ZW1zOiAxDQo+ID4+
Pg0KPiA+Pj4gTm90IHN1cmUsIHlvdSBuZWVkIHRvIGRvY3VtZW50ICJQRF9WQkFUVCIgcG93ZXIg
ZG9tYWluIGFzIHBlciBUYWJsZQ0KPiA+Pj4gNDEuMiwgdGhpcyBMU0kgc3VwcG9ydHMgMyBwb3dl
ciBkb21haW5zKFBEX0lTT1ZDQywgUERfVkNDLCBQRF9WQkFUVCkNCj4gPj4+DQo+ID4+PiBQb3dl
ciBNb2RlIFBEX0lTT1ZDQyBQRF9WQ0MgUERfVkJBVFQNCj4gPj4+IEFMTF9PTiAgICAgIE9OICAg
ICAgICAgIE9OICAgIE9ODQo+ID4+PiBBV08gICAgICAgICBPRkYgICAgICAgICBPTiAgICBPTg0K
PiA+Pj4gVkJBVFQgICAgICAgT0ZGICAgICAgICAgT0ZGICAgT04NCj4gPj4+IEFMTF9PRkYgICAg
IE9GRiAgICAgICAgIE9GRiAgIE9GRg0KPiA+Pj4NCj4gPj4+IFBEX1ZCQVRUIGRvbWFpbiBpcyB0
aGUgYXJlYSB3aGVyZSB0aGUgUlRDL2JhY2t1cCByZWdpc3RlciBpcw0KPiA+Pj4gbG9jYXRlZCwg
d29ya3Mgb24gYmF0dGVyeSBwb3dlciB3aGVuIHRoZSBwb3dlciBvZiBQRF9WQ0MgYW5kIFBEX0lT
T1ZDQyBkb21haW4gYXJlIHR1cm5lZCBvZmYuDQo+ID4+DQo+ID4+IEluIExpbnV4LCB0aGUgQ1BH
IGlzIHRoZSBwb3dlciBkb21haW4gcHJvdmlkZXIgZm9yIGFsbCB0aGUgSVBzIGluDQo+ID4+IFJa
L0czUyBTb0MgKG1vZGVsZWQgdGhvdWdoIE1TVE9QIENQRyBzdXBwb3J0KS4gVGhpcyBpcyBob3cg
aXQgaXMgY3VycmVudGx5IGltcGxlbWVudGVkLg0KPiA+Pg0KPiA+PiBUaGVuIGdyb3VwcyBvZiBJ
UHMgYXJlIHBhcnQgb2YgcG93ZXIgZG9tYWlucyBQRF9JU09WQ0MsIFBEX1ZDQywgUERfVkJBVFQu
DQo+ID4+IFRoZXNlIHBvd2VyIGRvbWFpbnMgYXJlIGkyYyBjb250cm9sbGVkIHdpdGggdGhlIGhl
bHAgb2YgZmlybXdhcmUgKGF0IGxlYXN0IGF0IHRoZSBtb21lbnQpLg0KPiA+Pg0KPiA+PiBGcm9t
IEhXIG1hbnVhbDoNCj4gPj4gLSBQRF9WQ0MgZG9tYWluIGFsd2F5cyBwb3dlcmVkIG9uIGFyZWEu
DQo+ID4+DQo+ID4+IC0gUERfSVNPVkNDIGRvbWFpbiBpcyB0aGUgYXJlYSB3aGVyZSB0aGUgcG93
ZXIgY2FuIGJlIHR1cm5lZCBvZmYuDQo+ID4+DQo+ID4+IC0gUERfVkJBVFQgZG9tYWluIGlzIHRo
ZSBhcmVhIHdoZXJlIHRoZSBSVEMvYmFja3VwIHJlZ2lzdGVyIGlzIGxvY2F0ZWQsDQo+ID4+ICAg
d29ya3Mgb24gYmF0dGVyeSBwb3dlciB3aGVuIHRoZSBwb3dlciBvZiAuDQo+ID4+DQo+ID4+IFRo
ZSBwb3dlciB0byB0aGVzZSBkb21haW5zIGFyZSBjb250cm9sbGVkIHdpdGggdGhlIGhlbHAgb2Yg
ZmlybXdhcmUuDQo+ID4+IExpbnV4IGNhbm5vdCBkbyBjb250cm9sIGl0c2VsZiBhcyB0aGUgQ1BV
IGlzIGluIHRoZSBQRF9JU09WQ0MuIElmIHlvdQ0KPiA+PiBsb29rIGF0IHBpY3R1cmUgNDEuMyBQ
b3dlciBtb2RlIHRyYW5zaXRpb24gWzFdIGl0IGlzIG1lbnRpb25lZCB0aGUNCj4gPj4gcmVsYXRp
b24gYi93IHRoZXNlIHBvd2VyIGRvbWFpbnMgKGNvbnRyb2xsZWQgYnkgUE1JQyB0aG91Z2ggZmly
bXdhcmUpDQo+ID4+IGFuZCB0aGUgc3VwcG9ydGVkIHBvd2VyIHNhdmluZw0KPiA+PiBtb2Rlczog
QUxMX09OLCBBV08sIFZCQVRULg0KPiA+Pg0KPiA+DQo+ID4gRFQgZGVzY3JpYmVzIGhhcmR3YXJl
LiBTbywgdGhlIHF1ZXN0aW9uIHdhcywgZnJvbSB0aGF0IHBlcnNwZWN0aXZlLCBkbw0KPiA+IHdl
IG5lZWQgdG8gZG9jdW1lbnQgUERfVkJBVFQgZG9tYWluLCBhcyBpdCBjYW4gYmUgY29udHJvbGxl
ZCBvdXRzaWRlIGxpbnV4Pz8NCj4gDQo+IFRoZSBjb250cm9sIHRvIHRoZXNlIGRvbWFpbnMgaXMg
cGFzc2VkIHRvIGZpcm13YXJlLg0KPiANCj4gRnJvbSBteSBwb2ludCBvZiB2aWV3IHRoZXNlIHdp
bGwgbmV2ZXIgYmUgdXNlZCBieSBMaW51eCBiZWN1YXNlOg0KPiAtIHRoZSBQRF9JU09WQ0MgaXMg
d2hlcmUgdGhlIENQVSByZXNpZGVzIGFuZCBpdCBjYW5ub3QgY3V0IGl0c2VsZiBpdHMgcG93ZXIN
Cj4gLSB0aGUgUERfVkNDIGlzIGEgZG9tYWluIHdoZXJlIGNyaXRpY2FsIElQcyBsaWtlIENQRywg
U1lTQyByZXNpZGVzDQo+IC0gdGhlIFZCQVRUIGlzIHdoZXJlIHRoZSBSVEMgcmVzaWRlcywgUlRD
IHRoYXQgc2hvdWxkIHN0YXkgb24gZm9yZXZlcg0KPiANCj4gU2hvdWxkIHdlIGRvY3VtZW50IHNv
bWV0aGluZyB0aGF0IHdpbGwgYmUgbmV2ZXIgdXNlZD8NCg0KSWYgaXQgaXMgaW5zaWRlIHRoZSBz
eXN0ZW0sIHlvdSBhcmUgZGVzY3JpYmluZyB0byBhdm9pZCBBQkkgYnJlYWthZ2VzIGFueSBmdXR1
cmUuDQoNCkVnIFsxXSwgdGhlcmUgYXJlIGludGVycnVwdHMgd2UgZG9jdW1lbnRlZCwgRG9uJ3Qg
a25vdyB3ZSB3aWxsIGV2ZXIgdXNlIGl0IGluIGxpbnV4Lg0KDQpbMV0gaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC90cmVl
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvcmVuZXNhcy9yZW5lc2FzLHJ6
ZzJsLXN5c2MueWFtbCNuNTgNCg0KQ2hlZXJzLA0KQmlqdQ0K

