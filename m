Return-Path: <linux-rtc+bounces-5456-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48597C8664E
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Nov 2025 19:01:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E3B73B2C22
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Nov 2025 18:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95AD32BF23;
	Tue, 25 Nov 2025 18:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="HH5CraaL"
X-Original-To: linux-rtc@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011038.outbound.protection.outlook.com [52.101.52.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B086C32C931
	for <linux-rtc@vger.kernel.org>; Tue, 25 Nov 2025 18:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764093620; cv=fail; b=KuN3tQMG5konzQF28HToTut9sdKbpMuOWbgWvMwKbXMMu2/J8pAWNfbHpB4y/u3E9fMgvNGa5iJg83wVwxxp/QdVShmh2UhK6OJFgfUy5zentRndQzwY1Ub0TgRmmbBvcer5dYCHPwUrxJ9rqtIY2Y0n4Vvc3au8c5OfmzLaG3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764093620; c=relaxed/simple;
	bh=APKyBFvNKJfzT83brW4pqbzcyhO94zX99XDxagXcZw0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fagkkxdUNI1Axk4rObWFT5M3NQXvQCYrrTUNzHmyoCmXCCaQE/XagW1/jfPuGEQlWpRxtZ6CuLiFveUfEkvZnK1twOI8jqlCik2zbjbrfV1PEsUk7n1TQVNegMJfPSccDyYs7T36EFJjHAdOTHx2RGCYsQUixPGhj+eFQHj10Sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=HH5CraaL; arc=fail smtp.client-ip=52.101.52.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wtKWVodXsP9mmQEe/MZrwcnXVS6kppHOFsQejxlF53IHofYFit4WIfTxS1XwNLulVdsYJvGctAop6znfccKl4diO6vvPLPh9Ea4YLCd6RQbnVxSkmcknUpcC6+7TDmYaCyQL1+DEAZpn8d6n32j+PrGx/y8/NVB1BbSdFFv1evErmBYNvOFh4FSVEDh6tk0W0Xoh0v43wFpcAd4Z5XceRvD7yxQsJrNmE/bEpPqkY2yEKh1ThrYRDXO1rRlcHS+HWhZIFxzM6ZNDuH+D0K6ivP2MeEAOK1GFsEwAeFArwINUDy+Wm9UHEr5LenDCa5NONmVxl8jSYmvK48UeAURkGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AC1+MliTC+8d1/k1O7ThzvtyfkpBCjaDHpGKuMflm1Y=;
 b=I3srjAx1J5YEwJNt9VwxTsA7oWAp3R5RiCE2aRtQOyj9/R1OFpt5C4XOJQ596w5ACZ5VnstI/i9InKY8DZypSrtLSTuxsFnCPdF2+JjD/gkfrZrtvWSnz3cCuXU7mj1pC9acfsvGVv4XUWcCI12OFZ9+29nqgJFJvUzvOt0n0JxBSu07vtl/bTE2q2cjZQZ15qJF99eJ9GzULsQwyg0JVxJHRqDlVrcl7SVrva6Got0Q3OIW1Re/iUEVEeESAidvaGMytsHnFr4Le+hQQ5sdekdMi2WuSBIBJxxs1/DY9yEUSXW0J7KHxsHELJYXOR0BFM2H3VQO+LJ0Z69T9YlLzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AC1+MliTC+8d1/k1O7ThzvtyfkpBCjaDHpGKuMflm1Y=;
 b=HH5CraaL7I7m7TuqxOxUmrlFHNe0f9UAqw6Ws+ekyuQ4fflrzYURYrP7jngeUnRdKK+tUAE2xGwWybCqGZ7npn/g6NWcYo1QhtHNxhRWeAbzChSkDzJBYJnVbMBEd7/6uz+0eHcPNubbdoOXCz6prHyYhG0O/AJNFhQZpM7jhy+D2BFF8vgQd4F/ZlrwFYVHqqDprVAqRtZpohNvQyl5TjELUK/bXSOfkI054gWELNYi7/MANJzjFikLBcbt3g7zYfu2aobiAuf3Gf9jw/n6Q9cEiaAaAe5ADewnWpDimg3yt7sCvI4s05R2+ONixhimmshnr8pc82p0WrThaFxI6w==
Received: from BN0PR08MB6951.namprd08.prod.outlook.com (2603:10b6:408:128::14)
 by SA1PR08MB7215.namprd08.prod.outlook.com (2603:10b6:806:1a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Tue, 25 Nov
 2025 18:00:10 +0000
Received: from BN0PR08MB6951.namprd08.prod.outlook.com
 ([fe80::4dd1:e1e:56b0:b178]) by BN0PR08MB6951.namprd08.prod.outlook.com
 ([fe80::4dd1:e1e:56b0:b178%3]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 18:00:10 +0000
From: "Anthony Pighin (Nokia)" <anthony.pighin@nokia.com>
To: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
CC: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
Subject: [PATCH] rtc: abx80x: Disable alarm feature if no interrupt attached
Thread-Topic: [PATCH] rtc: abx80x: Disable alarm feature if no interrupt
 attached
Thread-Index: AQHcXjUjXxngCZbMzESFOyDriV6poQ==
Date: Tue, 25 Nov 2025 18:00:10 +0000
Message-ID:
 <BN0PR08MB69510928028C933749F4139383D1A@BN0PR08MB6951.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR08MB6951:EE_|SA1PR08MB7215:EE_
x-ms-office365-filtering-correlation-id: d91d2fec-f193-4d4e-d461-08de2c4c79d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?hhpe85+8Tke5D22GBB2zCrRueTMEdARFnJZ5+UdfYVjhe6KKuvI+hr0fGV?=
 =?iso-8859-1?Q?wpZKr1FUoRylAdgMhJHfk71AUUd3n97ER7i5k82KG69nlHfX0ar5pQzQ2k?=
 =?iso-8859-1?Q?/ggd/q4h9xtr0H7nXztdVsMZiAXZ3iEcIifhygerUa5HQbuPHxVJF8MvDU?=
 =?iso-8859-1?Q?jS3o/i6sexsrqf2ekU55Q+8gp6sj+oxmlocDPh3ld9lb6k3vXxWkvEmE5E?=
 =?iso-8859-1?Q?W+jRyV8MCCaQSJ8Pd9vhwpdqIqeVmz3tvg6MWEkoTD5yCA1rbCzvaXyecu?=
 =?iso-8859-1?Q?ylWkeSmdNnF70N9W40ZPMFHjkepoF0XKAWVmVSfRfgFDPXIjINWyPLnZHp?=
 =?iso-8859-1?Q?hTqZrECCS9oQlntEG9Nhk3GKpEFpLO9qjBifKEOk47QU1/EKwHPR+lcRx+?=
 =?iso-8859-1?Q?CIzN/fobh/9wYeW6za7T+c0q3gbCbAFROXy3REHkm1atXF4Tni5P3BS39K?=
 =?iso-8859-1?Q?hx0TmvyrsRm2VfLH2cwtbufBz4VVwh8Z1KSnygqVcJZoO5Db1Bwng8d8DU?=
 =?iso-8859-1?Q?xkWBtbGCPEP6i9aDnkBWc30n9M/j2KkTefZQ7KwyDgOhj5MBAYaeza5Fyr?=
 =?iso-8859-1?Q?LXlGP+Mmpr1nims8nVh/4DAA/JbAru9ZM6GKITLNhQ2OJ7Ruw1QwvTZ+3W?=
 =?iso-8859-1?Q?1y+HXw0TZF3ONrakXxzvI07B4zPmxWbwr0oPDDXAN0Kpei9FfyJuUxd7t4?=
 =?iso-8859-1?Q?3rVCnj06eI4jus2VqTfRLy6Q+mAbiarPNdvRSJ1gPm72YgxA0YbGJs7Kb8?=
 =?iso-8859-1?Q?qCaLlvsSvtzsgAZWaoTkuETL404oJT+NoShkPwAgQlKY2gSryVWaMZi8OD?=
 =?iso-8859-1?Q?CrAtG4fCHumgWkCF9al8fkusRqG49QR+pzaOTpm5RmwgPLVUlgEJakKPAX?=
 =?iso-8859-1?Q?76AJm2yd16VXapaYjJtJx/9EYQE+R6EcOcRmcMyiTooeBhSMOaoVP8JnWY?=
 =?iso-8859-1?Q?lo/4ouIDJMFBzI6Km9DGLsqudpekikroq6g1c2oswgjGUAP8ZpkVkDNxT9?=
 =?iso-8859-1?Q?3WgzPKsZ5rvC5w6XwbVC3y6mKgBA2qpAd/cZ3+xeZcNocr94XhNr4mfqFs?=
 =?iso-8859-1?Q?5oIR79K754Gpfgs6E5bjWxE8Rb/brKtTxJ0TjjLIxzSTuq9K875slcUMES?=
 =?iso-8859-1?Q?4DLC2AkbwxvzdDoukgRCaGIUjUtwWaSmBqhUqIvaBJpjL7Xz6ZObLOlSUw?=
 =?iso-8859-1?Q?npMBYntBq5MSbWP4/qegzE/LdJG/0T7VXZ3mZkriPlIAvvB2F+M5R/BvWL?=
 =?iso-8859-1?Q?kdZXA1AWazAY8l4KJ0QbVOUmosXw7i+oKG95BUVeSQaQpJF//u3v7h8jE6?=
 =?iso-8859-1?Q?Mm3qH7l2SdFqLT3WwO6zStUzc9nzzuxrPNJ1wsSinkLCMoJFRGwgGc9qS2?=
 =?iso-8859-1?Q?M0rX4nuwE+7QtXhccfQWJg98DhsdoB5DVbziIaASo26eDpycKlQrWBfqbC?=
 =?iso-8859-1?Q?4FYWKrNDX9V50O2PPRNLTFwq0PZh77x9Zg9QJfuS9V2bSqncG8qr0rQhvr?=
 =?iso-8859-1?Q?xDgyNcD5J6WNr7g9PsKsR0j/lFBeqpgIqSD/DJnQ4ZHbHxzvJyqlBaNPO6?=
 =?iso-8859-1?Q?2I+yij9qhYjcCZhhRyiZLUqjrtls?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR08MB6951.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7gm9KhdjZTmLDl5UZvMtVsWVcTHDMRLuFmYzzl79j/TDi+ALRz1HL8p/2X?=
 =?iso-8859-1?Q?K7udSoqfE1rBsfPCWBklPDBzIyaqTfOROCKrRiwWjpoctMK5ObAuvf3RKs?=
 =?iso-8859-1?Q?k7h7bGVUQX7KxwGfFRPQ1/i+OxV1XMfbme5zdSVwH1OU9ucH6XqsuuCg6Y?=
 =?iso-8859-1?Q?kVCFE4W9TFs8fUK6a8jdO6CH+i+cVqSx9MVylZybSQwa/VwFSZAwtc/z57?=
 =?iso-8859-1?Q?s0gXQYddJBQubWk4gLvISgoPHhrr4IifEzNb5Jqt+jv0xdKerv6w67w7fu?=
 =?iso-8859-1?Q?G27ZugYHXmrwy6GJc1MqlhIn8RmPvOy6XfjBQcLhVkenwRS55x05+hIB8W?=
 =?iso-8859-1?Q?VoqlhErNmCXsAo4pKDKW7RPXNIoe8ajtHwdXcAyX3NVEY4tw2GKVEIn1E0?=
 =?iso-8859-1?Q?qOP0tOUTH4SqBtSI/0xDLlD9VMcJ1fKSmDNCCEyed7LuN/yE6TVEs9VrKV?=
 =?iso-8859-1?Q?0d3WYk7EkosHpr5c3yvBQd3WLR2nWqMdXA2VNVVPxUVuQSAz3f73izo0x4?=
 =?iso-8859-1?Q?NpmuGACfkZDj7HkSq7W3KSl+kMDvjPgyaaFPLI5oRwz4Impvd+LP4WCjUE?=
 =?iso-8859-1?Q?xY0lBf09vDq0kr/EuY1IIqIS4OTGCZa0/Qwf+yO3ceQXHWVU/56loPSDpo?=
 =?iso-8859-1?Q?0ojS5J9ZmbWKVsMaDMi+B95EaEgXLW3v8LJ6wmz230cnYEsxj8t0BMCsFT?=
 =?iso-8859-1?Q?9HxOfvtZbDYMpYYDqcX7aYogoQEn3mPFJILeL9+nBqc9QOzer5fy027hxl?=
 =?iso-8859-1?Q?A7zj9FOG8dq6WvVKZlBx6PqqmXQifDuolsmevAuViKb9RD3+fDhwYb5rQI?=
 =?iso-8859-1?Q?kowwupvincOcnF2LOqYk3T8cz0UH68XUTtAB7UFncCabsTu3+VjH7R0cEs?=
 =?iso-8859-1?Q?xeGf2VrImV0lb7qkPsmCpTuu+wkwFmdUJ/E+1S7HyKlfvXNMyFmjTSops5?=
 =?iso-8859-1?Q?bW+Oxu/plaTPjRHP3foUnjQIg/bdfHf4RUvtnmOrJ1lDACK4ItqJXIfuUJ?=
 =?iso-8859-1?Q?bs8TtsTwTXaKek2UiDF9wXcLb4/PKE3eT3dv90f6goKBq39nvOoBy/HvVh?=
 =?iso-8859-1?Q?GXOKhbsjrEuZII2bCegcDbtIMSPjYby8eYGxAmRja0xuzf4DlywwEKRbQe?=
 =?iso-8859-1?Q?UcYbLLXZWMkClPmQZKB9u754EaUZxDNgCQHwCY6DDOfG1VJdn7MzkrlGKr?=
 =?iso-8859-1?Q?niRsMZrkT+6MG1yjXRpxEJ0h1IHMNNoD27K+ossWotnAr9/qUdou6M2Foy?=
 =?iso-8859-1?Q?Nnnc5cZDcOg7/lml+JNHudYIJMdxnYI+2UAzoQ158Ma412KViymeSUd2s1?=
 =?iso-8859-1?Q?iGAxncgi71HaU+dTmMYKU2zl0SUO8JLIfxjXQVRjLAwl87BzxNHYIMwAMf?=
 =?iso-8859-1?Q?XLOATn+xBDL4IXZYz58F+mKcHX7dblKb8v8zF8ntJ3baRlbh0lC78f4hxB?=
 =?iso-8859-1?Q?AQkbKyrEhLA5iyIpz3qF3vC4FtBpezDCIZdjbkeG1n+fZ50qp22I1ae+Ms?=
 =?iso-8859-1?Q?2KVc7UFfky9sSYYjxYCLUo6oShkjHqEhtm9p/MnZK4i8xKTJScZ4fQ0vFY?=
 =?iso-8859-1?Q?JGDkWhfwr8Ury2TeCivrM1BVrxVv+w4Ez3OXTUFnP+CT77TwHr5f7K0w1K?=
 =?iso-8859-1?Q?pxuj+pUfWqM8eLhH0/wC3Q6yXmVvAqLX5k?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR08MB6951.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d91d2fec-f193-4d4e-d461-08de2c4c79d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 18:00:10.6456
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iHvrtZPUlMY2EbJ81w+F0gOFB4dbLPf8JRK/ElAqcWIMaQGDqdqBLKbf27yi4X4CQWyReRc8QvpTlpa1gR0vSMHkCq+8km0J8kpYPX9cxqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR08MB7215

Commit 795cda8338ea ("rtc: interface: Fix long-standing race when setting=
=0A=
alarm") exposed an issue where the rtc-abx80x driver does not clear the=0A=
alarm feature bit, but instead relies on the set_alarm operation to return=
=0A=
invalid.=0A=
=0A=
For example, when a RTC_UIE_ON ioctl is handled, it should abort at the=0A=
feature validation. Instead, it proceeds to the rtc_timer_enqueue(),=0A=
which used to return an error from the set_alarm call. However,=0A=
following the race condition handling, which likely should not be=0A=
discarding predecing errors, a success condition is returned to the=0A=
ioctl() caller. This results in (for example):=0A=
    hwclock: select() to /dev/rtc0 to wait for clock tick timed out=0A=
=0A=
Notwithstanding the validity of the race condition handling, if an interrup=
t=0A=
wasn't specified, or could not be attached, the driver should clear the=0A=
alarm feature bit.=0A=
=0A=
Fixes: 718a820a303c ("rtc: abx80x: add alarm support")=0A=
Signed-off-by: Anthony Pighin <anthony.pighin@nokia.com>=0A=
---=0A=
 drivers/rtc/rtc-abx80x.c | 2 ++=0A=
 1 file changed, 2 insertions(+)=0A=
=0A=
diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c=0A=
index 3fee27914ba8..5f3a3e60a19d 100644=0A=
--- a/drivers/rtc/rtc-abx80x.c=0A=
+++ b/drivers/rtc/rtc-abx80x.c=0A=
@@ -933,6 +933,8 @@ static int abx80x_probe(struct i2c_client *client)=0A=
                        client->irq =3D 0;=0A=
                }=0A=
        }=0A=
+       if (client->irq <=3D 0)=0A=
+               clear_bit(RTC_FEATURE_ALARM, priv->rtc->features);=0A=
=0A=
        err =3D rtc_add_group(priv->rtc, &rtc_calib_attr_group);=0A=
        if (err) {=0A=
--=0A=
2.43.0=0A=

