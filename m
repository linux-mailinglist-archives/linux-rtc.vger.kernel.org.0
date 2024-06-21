Return-Path: <linux-rtc+bounces-1384-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 389DD91298B
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 17:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC8151F20F4A
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 15:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC91784A54;
	Fri, 21 Jun 2024 15:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b="PygL3IAn";
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b="PygL3IAn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2110.outbound.protection.outlook.com [40.107.21.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADF07404F;
	Fri, 21 Jun 2024 15:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.110
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718983455; cv=fail; b=O83XG4Vt36cPrWKcm5EnWzBw/nkOkElaEvY/UcTCoQJt3sJsm3cypIhlCtGcn0J0NJhccTIkW0v/2ilicGfM5+pnYOwWX3d1ITqifE1hP4GJZW+eY9f4rdHuQXbiphjJK4+p2aZn9DYZgxLV3Out8ceTvgwTUmjYkShmqfW5jAo=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718983455; c=relaxed/simple;
	bh=eIySN6szxO3Mk6zuyzsav0SqFiYPhU827/3AcHB6Kn0=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Wmsh3NtY+5/NpkqQEBF8hO40PEG7D69BwUyfUE9NdO3g9kThq3WIcli8xsYbYZVYl5idK3IgjAz9D0H7MYhJyTIH2zIWMrqyk1tDab8QSSBaqeuv+mU0k0irb2mahNf6g0q2iLrz7zPNYqcaRPyGJ3ENdMtzr+YeNC6ZeFgCN7s=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seco.com; spf=pass smtp.mailfrom=seco.com; dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b=PygL3IAn; dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b=PygL3IAn; arc=fail smtp.client-ip=40.107.21.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seco.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iS6Bf2e3hw+pAnuoooGx2A/YQcACb0AlEjgX/6M8OlEDkGJ6ChqMJbJ3XaHhJg3geKbCoD+xADTxnYKGxW3bKytGsw1AgabeLk7vG0BDz7ms4m6MfyIgV8r4TPdSp8bGSW5enQeammPxwL5TierNgF25LYPz8U5L6CaaBaykvVTx7z2FRpVwiW64GitDn732I+OsBHYT5Q3ZEh+/1J0XBHaOEtIC5v8DPEeZCD/NSDXsnL0QrP7bpEXTx0eaR+0LOchpKlkQbfK28WGfTNGY/O8gGSAtpnhTjvsZt2MH0l6PSHKyQQPjY9yNj3uOfcHcZBTDVag4R7O9sewmOpLQoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWWWKh2t6oDHfIsZssz4Ic1hGeDMIkNUKoAhWgNW6j4=;
 b=Urae5rZ7qAWgqDIJVLTOerXJ+3QoeCHBGz9D1vECkMk79mhz8Gibmm8Gr6eU9pqtDMMa2F3FKFXOA/7Q1mnZMRtKsISDzeOv/1VOkpDFShse2xQgCWe6o4BaTn8Ukql+bhjEI1CNZfkAf/nKV8tEchcFxCuvlGoNpPLbPylrO+81uajt1ksszZMW/J715sE7lrB4ug4oOkpFT2mc7y5mNHTm+j1DnxbLN1/RefsyN1gHI4j1Vfh7xvbicQtAnbwS0Y+AG6s0cEvHr+/+e89iSyjs+PHSp8sRBPokxRLbR3RQkV3pxy5KfMbNDgNUoiYDaQi2q82qXtFNpQ7tOc0ctw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.160.56.83) smtp.rcpttodomain=bootlin.com smtp.mailfrom=seco.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=seco.com;
 dkim=pass (signature was verified) header.d=seco.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=seco.com] dkim=[1,1,header.d=seco.com]
 dmarc=[1,1,header.from=seco.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWWWKh2t6oDHfIsZssz4Ic1hGeDMIkNUKoAhWgNW6j4=;
 b=PygL3IAnllAq15R+Yr9d0t1rT7CgqlZ7j9xUH8+pckuXQVYIdd/lrTe83xJwO+LpOVmBJCyxfEEEautoXSScksxInQjv8ZqHsvViOTZziI/faD64ao0YqzwTUNEU81edgIWTQ5i5XVMAIiWDJ8FJbcZU3ShBDWL9n0/+Ml9EyrIpfrKl0iA5Wc++eHNpEbVl/XLYqAZwcLZEKqjCGXOIzR0or76late3mg2fBUvjTf/MCCUZT05toyHR1U1f9EWe1C2ETE5KSTCCiCxHnfB9JlZw5q76+dEKb5U/A1krZvJN3GU1LQdBOQQIFI2VeGftqHX9h8y5jOlIVmo9fSyUpQ==
Received: from AS9PR05CA0339.eurprd05.prod.outlook.com (2603:10a6:20b:490::7)
 by DU0PR03MB9470.eurprd03.prod.outlook.com (2603:10a6:10:41a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 15:24:04 +0000
Received: from AM4PEPF00027A63.eurprd04.prod.outlook.com
 (2603:10a6:20b:490:cafe::d3) by AS9PR05CA0339.outlook.office365.com
 (2603:10a6:20b:490::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.37 via Frontend
 Transport; Fri, 21 Jun 2024 15:24:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.83)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.83; helo=repost-eu.tmcas.trendmicro.com; pr=C
Received: from repost-eu.tmcas.trendmicro.com (20.160.56.83) by
 AM4PEPF00027A63.mail.protection.outlook.com (10.167.16.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Fri, 21 Jun 2024 15:24:04 +0000
Received: from outmta (unknown [192.168.82.135])
	by repost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id F1D7720080F8A;
	Fri, 21 Jun 2024 15:24:03 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (unknown [104.47.11.233])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 4F8AA2008006E;
	Fri, 21 Jun 2024 15:24:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9viNva3n8o1c6qSuEKCCQ3T7bb8f7pvH5WBLCH9K2iStkRZWzeficDUDNLNbkWBcuz+zZ7aJNIpzA0zkm9HwSNVOsXgDcbvOLpHHnr3ZVAXegwaLxEp290W85/Xnlbf7eHFde3D+H7Y+5Iug5KvS+Pci9PMQPc42A87HGnoRjJrVnG115hu6NOOv2IP5eVL7CMx6QpeH455ZHIoGV8QWvRFvxEapann8hZl6lsrsPcHovZZXQoecby4e+nQ7KlRIClaBhvWc0mnYc19Xn3MF61RVGsiRXuRfzX6lDlNaR5qMUvPLOlAasmgPegekIleeT9eYMmatL0vv7R1csVYow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWWWKh2t6oDHfIsZssz4Ic1hGeDMIkNUKoAhWgNW6j4=;
 b=XzH8k2IjKsM6DyFNDCYE8eUsnE0y4O0MWtM902jXsJa/Jy3P1mW+I7hFfCoqWLIkeEwJF5R/GQiX9WnISUWsHmnpcx5PbJo3sqe6BZqbZC54q7c93fhJAmaCIF5f89j08u8/YFtI+nYjmzixoXCTrhkav7V9doxP9Qkb8tAU/jwPmETMphxgMew7nFqmgCGDFBlPLqDjXojjmyxo1FQINp8SdGwcukmvUncv1CBywd1U3VwA5BEljTlUhusnzgFg8Oss5nkeR6C1m1YiqNnIpXdMHiUOVpsisQRWTwAM35ImTMr++jiPvneKOymeGW+B5sy4R6XP2J5Gto9nrfQ5IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWWWKh2t6oDHfIsZssz4Ic1hGeDMIkNUKoAhWgNW6j4=;
 b=PygL3IAnllAq15R+Yr9d0t1rT7CgqlZ7j9xUH8+pckuXQVYIdd/lrTe83xJwO+LpOVmBJCyxfEEEautoXSScksxInQjv8ZqHsvViOTZziI/faD64ao0YqzwTUNEU81edgIWTQ5i5XVMAIiWDJ8FJbcZU3ShBDWL9n0/+Ml9EyrIpfrKl0iA5Wc++eHNpEbVl/XLYqAZwcLZEKqjCGXOIzR0or76late3mg2fBUvjTf/MCCUZT05toyHR1U1f9EWe1C2ETE5KSTCCiCxHnfB9JlZw5q76+dEKb5U/A1krZvJN3GU1LQdBOQQIFI2VeGftqHX9h8y5jOlIVmo9fSyUpQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from PAVPR03MB9020.eurprd03.prod.outlook.com (2603:10a6:102:329::6)
 by AM9PR03MB7073.eurprd03.prod.outlook.com (2603:10a6:20b:280::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 15:24:02 +0000
Received: from PAVPR03MB9020.eurprd03.prod.outlook.com
 ([fe80::2174:a61d:5493:2ce]) by PAVPR03MB9020.eurprd03.prod.outlook.com
 ([fe80::2174:a61d:5493:2ce%7]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 15:24:01 +0000
Message-ID: <6e54ebbf-fad4-46bc-8b5a-e92acdb6b643@seco.com>
Date: Fri, 21 Jun 2024 11:23:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rtc: abx80x: Don't warn about oscillator failure after
 PoR
From: Sean Anderson <sean.anderson@seco.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20231019163931.3682923-1-sean.anderson@seco.com>
 <c3cda013-eab0-46c0-a89a-ed51ecfd1e1d@seco.com>
 <ff40a221-38b5-40d7-a0fc-cf617853a096@seco.com>
 <c7c90be3-8dcd-4737-9fce-01343da01855@seco.com>
Content-Language: en-US
In-Reply-To: <c7c90be3-8dcd-4737-9fce-01343da01855@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0324.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::29) To PAVPR03MB9020.eurprd03.prod.outlook.com
 (2603:10a6:102:329::6)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAVPR03MB9020:EE_|AM9PR03MB7073:EE_|AM4PEPF00027A63:EE_|DU0PR03MB9470:EE_
X-MS-Office365-Filtering-Correlation-Id: bbc6d988-5740-4be3-d27c-08dc92062f6f
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230037|376011|1800799021|366013|52116011|38350700011;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Tk9Ea2hYdlBUZFpsQWlMMFE5MmZlQ0tsbXFmaWVzeGtpRzJjUzZwWmVtVHJB?=
 =?utf-8?B?ZUNjQTlDRW11WWYrZ21xb1IwVDlMeVJJV3BWV3BNK2Q1bEVmZWFlN0swcG1h?=
 =?utf-8?B?em1ZNDlGSGRJRjlIMDF0Y1Z0a09wR1lodWpUZndHbTA1UXl0NHUwalgyM3pl?=
 =?utf-8?B?QXBqcFViTkszc0s1d2MwWExrVGNva3VzdkxkNmlIeVFjcXdOREd6R0VBTXpz?=
 =?utf-8?B?YVczNGlSaHNpRDVnQk1ZMHZXWGhNd0J6dVZCaTNWTDdLVTdMMGpLRFhiWDRx?=
 =?utf-8?B?U0c2bDJWRDUxVGwwOFVyWnRuZWFBT05tREg0VHQweTd4ZFRaMk9VMzBDdi9S?=
 =?utf-8?B?aERBcENjc3laaUpIU3kwUGRTUCtNWitoRUk5cVMwQ21hRjJBL3N0TXdnSUlQ?=
 =?utf-8?B?bTRsbW80bVkyUzY4blFNTWM3SjRNazM3MTBJc3NiRGNPV3JYTk5oUWVRN1Ew?=
 =?utf-8?B?Rk05eGR6Ni9pNkZPSGpEZzVYWk5uVUt1emd0YVQwd0w3N2pWVGlVL2U2R1Nr?=
 =?utf-8?B?WEtYS2RHQXJCNlJ0QlF2aHY4TWZiT0xlY093WjIwQ3lROVdQUlNlZis5Ty9O?=
 =?utf-8?B?bHJFNW0rbWR3VXRxWDIvOFRtS242TkJNd0hkV1J4a0pDMFVSbXJZZDc3dVdU?=
 =?utf-8?B?eDloUWR0bFdQb0FFZmRJT3YySnQzdDB1TGZ4OTA3N1p2SC9Oa29iTGVjWGF1?=
 =?utf-8?B?MjF3eG5veWFlMVY4M2xGQnlkSm5rU3FvSCtBSzk0TkhIL3kxV1k2eXFOQ0l5?=
 =?utf-8?B?ZmVDczhMTDIrUTFreVZXZFBtY1NjVlFxZzFTbE9rQ05Wc1ZPNXRBNXNNZWF0?=
 =?utf-8?B?blg2UGdxZ2lrK0J2MENtSDVGdVhlcFM3dDZKWm5qQVhQeVdmQ2ZyazlmR01h?=
 =?utf-8?B?NHVkRWcveFRCSzQrcXhXMXZBVVJ3NjhrSzI5Z1BvTnZHNmRMRFdCbThKa3ZO?=
 =?utf-8?B?TlpaZVYrVDhxRURtYWRrNUYvM0tUTWtESnl3YmhIcTIzcTNQbnZRQ1A2M1Zy?=
 =?utf-8?B?WnhrVzhlaEh2SVA3ZnB0UGJtcHdGR3MzU0s2a0RROUNScFlDdUs5OVpmaUtm?=
 =?utf-8?B?aEErdllwMnF0ZmhkOXNqcDRMRk1aSkZ0WG1reDhVWjhyNjhPWjBQNGx4NVdy?=
 =?utf-8?B?UnNCc3A0bVRGODNES2RlcWJJdi8weTFoQWp4angzM01ReW5QTU5ETEZ1MmxC?=
 =?utf-8?B?bExPTmZ0ZjR1OGtTMC9qcTdoK2p2eEpHMDFMaUZUNzhmdUh6MGM1d0lOQnVD?=
 =?utf-8?B?a1k0UzRMQTI0ZmNkTjk3K2swc0JwNGU2a3ZPeFR5ckZmcnMxbzAzQlVINHJN?=
 =?utf-8?B?Y2I2WHczejJVNjA5MTh4M0JvT3hQdjVQMmdETjVSUDdEbExOL3M0dEtncWJw?=
 =?utf-8?B?RFFkbXkrajZqdzFqR2FyYUs2NnNXMUFwdWNhL0IrTGtzbDRuVkd0U2xpS1Ay?=
 =?utf-8?B?M0lpNURDWEZJNUs5Y0pOZHhqL3Z5WDFmWEMzQXg3OC9rYlZ1VmpsYUxQLzFw?=
 =?utf-8?B?RzQzQzB0clFTM3VQSXo3QjNyNHFNcFlwMzFScU5XOUdwTGhXQ3ZPQU1RdlNW?=
 =?utf-8?B?dTZqT2FiaWhhYWNUcG1BZzE4TzlUdjE3OWhkcEJRRFozaE9jYjJpNTJIOTBT?=
 =?utf-8?B?NzE0MnB4YnZBSldDaXlubmRxVWRTMjIzOGlyMVJYWUVUVUNhVXlMRlgyOGJI?=
 =?utf-8?B?RFdrenB4T3F6Q1BnQUw0N1JjRXZ5MXpqOGhMRXUxaXFPQ0JHMEtKTnFSWG9S?=
 =?utf-8?B?cm9wZHRyMk1pV2FYWUFYTXE5dERWaGxWd0Y0d2pCRGFGVmxtd281UWg2QWdP?=
 =?utf-8?Q?lUzxEywH7DE8GM1Dpd4mhbuGylrXcFQQ5m+ZU=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB9020.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013)(52116011)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7073
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5b368123-9ae9-4ac5-9c98-08dc92062dd7
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|1800799021|82310400023|36860700010|376011|35042699019;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?STAvMjhvVjAwMkxrOHVyaUErajNYT0Z2V3hxd1QxTDVtTFA2T2Z3Vm5qbng4?=
 =?utf-8?B?ZVdYRjVVY3VqWTgzb0pBTlRjcnpaeXpDQXdYdVRCMDdxZjNucUg3RUhQdlNR?=
 =?utf-8?B?N05td0l3UzRtVk9OUWZvTHI5YTJaM3BNMVlTeVNaTW5yN2xvaDQranZ3TURD?=
 =?utf-8?B?OHQ4TG5VekdMbm5LZXVCM1hyZ3FYb2I5T2pmdGFOa2NHRWIrNFhtNUZGYk5m?=
 =?utf-8?B?SElZL0hkVXJnY0RMM0l1TDB5VEJtWE5wRHRNdm02Uk10c0hObmRDRkZLTFdk?=
 =?utf-8?B?TXc5SFlldjZHTStVS2w4S2ZmNkorOXVKQXVYN2hLZ0V1cVBPdHNtRjRhbzN0?=
 =?utf-8?B?WVpDWjFTR0dKUGJBaVpBV1hjaDNHS1gvcmxrVjFrNGcrSjZIRXVWNmhuSlVh?=
 =?utf-8?B?c3FFYUEvbmswdE5lVjhWcWREd1NjYXUwQlBVZ3FIRUtCWkdTd251eUE3UTFZ?=
 =?utf-8?B?STRtSkJJNmxkZHdrVlBBNDh2anpjVHNONmhsdFNiTC8xalNCV2ZGZ0d6Sy8y?=
 =?utf-8?B?QkIxQ2JwdElsWm1qY0QwTXNFS2RHSGMvSEh2eUtvLzFQTXhHbitNVFhjYnMy?=
 =?utf-8?B?T254M1ZIQUlPRjFTMjlpYkpPRFNlMjJWb1lRM1hKRnpwRksxNnFjQkI0czlv?=
 =?utf-8?B?K09mVFVnUUZGQnRZYjdRZE5uYm04UHRtWS9rVnE5cTdoTUlZUlhER0dtNjky?=
 =?utf-8?B?TU5rQlM2QnR3K2xTOEdVYWhxeUVZd2lJWXBxVzgwMUxvaUlvZ0lPMnVWYzZO?=
 =?utf-8?B?MHE5bmVMNWNkWTVNdWt1ODl0ejVCZENnWTdDa09LbDBscW5GU085VHRZMG0r?=
 =?utf-8?B?OEcyWExJZnJ6WVNJZEhaZzFXZ0h6a29LeFM3QXpwY1hHYVd0RjhOSE5LK25O?=
 =?utf-8?B?czRvWHR0NlZaYzhGc2FGU0llcU5wWWxCdXlWK29PZ2QrS0hMWWFpcTRLZ2la?=
 =?utf-8?B?NkZtdCtISUdyemx0dCtDNVQrWnpFQmFXSGRSMHpqMWlkY0NvYkh4YW5yV3ll?=
 =?utf-8?B?WjZzdEl1MGNSKzhveFJEZStUcnBHMHZJNlpXbWJIWjk0ZFphNVQxYjA4VE1h?=
 =?utf-8?B?ZFhQMkxrNXhuNG9LOUdLSEhsOGdDcWMzMmdDNkdvRHlSZjlWMkJHdXJxblYy?=
 =?utf-8?B?eFlQdkhXbHloclBseG91S1pxT3VFdnliUHhDd2IzbXpmRHRjRDNOTnc4U0FP?=
 =?utf-8?B?RDlzVHQyNEJVOTQrbXdlSEgzc3lCOG9seVI0ZS95b3hhUTBDNm5wSVMrMy9p?=
 =?utf-8?B?U3ZCa1pyOXZxTnRiVHBUTXZBZW8zUm5EenNIT2huUUZjUDlZdHJhaDRYQk83?=
 =?utf-8?B?bTdxM2NjR1AvY2F2ejBMYWdScStzWFQ2NXBwdnpmMVdTdEZqbUFPTU14b3JR?=
 =?utf-8?B?cHcvS2ZKaExSK1h1Y2NHcXpKVUZOWUVtVUNpMEh5MWNOVDRCWVVSZVlxT2Rn?=
 =?utf-8?B?M0xDY1pBeHpJNkg3dlFvYWdLSm5HYXB6eGYyamhWSkMxdHRzY003YkhvcHVG?=
 =?utf-8?B?U0UwY0tRWUxFc1FDaGVmTDhnVkpZd2szL2ZzT291RkVldmVIdUZHVHFxSlNU?=
 =?utf-8?B?Y2ZsbGlaaWpSVm1mS2FTSVU5bENwZ2d5SzBTc1Zxam0vd1pZTlRDRml2b3lF?=
 =?utf-8?B?TTd0VzBFZlRWY0RaVUFQSndmV2xpU0x2VjlEQzZlUzdoamxzNDRWRHJJMllJ?=
 =?utf-8?B?S2tYWFNaMXhETG0zamZUemsrUmlGVHdzZEJ0aURIa2d3Zmx4MjBrMDBLamVj?=
 =?utf-8?B?clVKQVRFSXZ5ZlEwSVNSZkFESE1uS3ZBTU9jT3kzZHhzbkhvNlFxa0ZUL08v?=
 =?utf-8?B?TVNwSXV0QldHN2w1U2RxNXpCRU1sUjlYbzlwbm1WRktHQWtsVkQ5T012emNq?=
 =?utf-8?B?T2dOT1lMWGhOc0NqcjlYNlhCL1dsSEZzNXRiUHJuSmhwT1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:20.160.56.83;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:repost-eu.tmcas.trendmicro.com;PTR:repost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230037)(1800799021)(82310400023)(36860700010)(376011)(35042699019);DIR:OUT;SFP:1102;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 15:24:04.2615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc6d988-5740-4be3-d27c-08dc92062f6f
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.83];Helo=[repost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9470

On 1/25/24 12:14, Sean Anderson wrote:
> On 1/8/24 17:05, Sean Anderson wrote:
>> On 12/11/23 11:03, Sean Anderson wrote:
>>> On 10/19/23 12:39, Sean Anderson wrote:
>>>> According to the datasheet, the "oscillator failure" bit is set
>>>> 
>>>>> ...on a power on reset, when both the system and battery voltages have
>>>>> dropped below acceptable levels. It is also set if an Oscillator Failure
>>>>> occurs....
>>>> 
>>>> From testing, this bit is also set if a software reset is initiated.
>>>> 
>>>> This bit has a confusing name; it really tells us whether the time data
>>>> is valid. We clear it when writing the time. If it is still set, that
>>>> means there is a persistent issue (such as an oscillator failure),
>>>> instead of a transient one (such as power loss).
>>>> 
>>>> Because there are several other reasons which might cause this bit
>>>> to be set (including booting for the first time or a battery failure),
>>>> do not warn about oscillator failures willy-nilly. This may cause system
>>>> integrators to waste time looking into the wrong line of investigation.
>>>> 
>>>> We continue printing a message about invalid time data or an oscillator
>>>> failure. There is no voltimeter in this RTC, so this is the best
>>>> indication that the battery is dead (or dying) and reeds replacement.
>>>> 
>>>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>>>> ---
>>>> Note that the following drivers all warn when they detect a problem with
>>>> the oscillator:
>>>> 
>>>> drivers/rtc/rtc-ds1672.c
>>>> drivers/rtc/rtc-pcf*.c
>>>> drivers/rtc/rtc-rs5c*.c
>>>> drivers/rtc/rtc-sc27xx.c
>>>> 
>>>> So warning about such an error has good precedent.
>>>> 
>>>> Changes in v3:
>>>> - Use info since this is a good indication of a battery failure
>>>> 
>>>> Changes in v2:
>>>> - Use debug instead of info in the typical case (no battery)
>>>> 
>>>>  drivers/rtc/rtc-abx80x.c | 17 ++++++++++++++++-
>>>>  1 file changed, 16 insertions(+), 1 deletion(-)
>>>> 
>>>> diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
>>>> index fde2b8054c2e..f463a58a240b 100644
>>>> --- a/drivers/rtc/rtc-abx80x.c
>>>> +++ b/drivers/rtc/rtc-abx80x.c
>>>> @@ -127,6 +127,7 @@ struct abx80x_priv {
>>>>  	struct rtc_device *rtc;
>>>>  	struct i2c_client *client;
>>>>  	struct watchdog_device wdog;
>>>> +	bool wrote_time;
>>>>  };
>>>>  
>>>>  static int abx80x_write_config_key(struct i2c_client *client, u8 key)
>>>> @@ -179,6 +180,7 @@ static int abx80x_enable_trickle_charger(struct i2c_client *client,
>>>>  static int abx80x_rtc_read_time(struct device *dev, struct rtc_time *tm)
>>>>  {
>>>>  	struct i2c_client *client = to_i2c_client(dev);
>>>> +	struct abx80x_priv *priv = i2c_get_clientdata(client);
>>>>  	unsigned char buf[8];
>>>>  	int err, flags, rc_mode = 0;
>>>>  
>>>> @@ -193,7 +195,18 @@ static int abx80x_rtc_read_time(struct device *dev, struct rtc_time *tm)
>>>>  			return flags;
>>>>  
>>>>  		if (flags & ABX8XX_OSS_OF) {
>>>> -			dev_err(dev, "Oscillator failure, data is invalid.\n");
>>>> +			/*
>>>> +			 * The OF bit can be set either because of a reset
>>>> +			 * (PoR/Software reset) or because of an oscillator
>>>> +			 * failure. Effectively, it indicates that the stored
>>>> +			 * time is invalid. When we write the time, we clear
>>>> +			 * this bit. If it stays set, then this indicates an
>>>> +			 * oscillator failure.
>>>> +			 */
>>>> +			if (priv->wrote_time)
>>>> +				dev_err(dev, "Oscillator failure\n");
>>>> +			else
>>>> +				dev_info(dev, "Time data invalid\n");
>>>>  			return -EINVAL;
>>>>  		}
>>>>  	}
>>>> @@ -219,6 +232,7 @@ static int abx80x_rtc_read_time(struct device *dev, struct rtc_time *tm)
>>>>  static int abx80x_rtc_set_time(struct device *dev, struct rtc_time *tm)
>>>>  {
>>>>  	struct i2c_client *client = to_i2c_client(dev);
>>>> +	struct abx80x_priv *priv = i2c_get_clientdata(client);
>>>>  	unsigned char buf[8];
>>>>  	int err, flags;
>>>>  
>>>> @@ -252,6 +266,7 @@ static int abx80x_rtc_set_time(struct device *dev, struct rtc_time *tm)
>>>>  		dev_err(&client->dev, "Unable to write oscillator status register\n");
>>>>  		return err;
>>>>  	}
>>>> +	priv->wrote_time = true;
>>>>  
>>>>  	return 0;
>>>>  }
>>> 
>>> ping?
>> 
>> ping again?
> 
> Does anyone read this list? This patch has gone unreviewed since December of 2022!
> 
> --Sean

ping again



