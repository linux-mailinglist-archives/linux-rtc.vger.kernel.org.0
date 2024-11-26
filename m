Return-Path: <linux-rtc+bounces-2623-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA1D9D965C
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2024 12:44:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA42E167DB7
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2024 11:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 362701D1724;
	Tue, 26 Nov 2024 11:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hdFsu+Bm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16A11CF2A2;
	Tue, 26 Nov 2024 11:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732621471; cv=fail; b=e3NA253Bvz2JU9GCejhUb/leXAG2VU4S5MoJzeUEN8Mm6ovRqgSgGynvPI+nEZUzwAnVgSiLNCbqKJLiemqojd8x3EDXBcXQw0v+BQlhaeEQblGvgxfup8gy+NTTdtFLJ6cR8JF8yFIfVZ+ncHnxQ+nVK0jS5LwE+lQJKUAydzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732621471; c=relaxed/simple;
	bh=wVzklaZqxFnGmbOFYfFRik23OPV6ZB+ed3Afi8bLujw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rF1Xcw/ziS88WARKDCVt6tY3tCYE4gIApvAo7mAWppucEdjfu2gFGsaeYziRQ0D2iKn7HYQabyVu9g58SKw4MnkbGtIyiKKw76RgBIM1QfeYHzca7VeliUBPYYJVMiLF9qxt/jWepx7PAMMpzL/8l/i1KhJTEB35lQhGhVT55UI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hdFsu+Bm; arc=fail smtp.client-ip=40.107.22.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oeJ2x922085lpLjBuf7CKp+otxlCz4lpsQGJIX40GGgjS8gohZWv09xG2inhnqkkMLHOD2eZVnA6IUGVqqlLHNTJ42JUw6OfUonMcYl9TBA0e3+RWLzUrosapjikSB2NyiiXUmsIOgQh0Y0TuUVzkFxrFdGmamolpiqon2ERhgUIUuXx1SajhaALbqNvUV+psxh7Lj0B/xrealVa1BhVw85fOIgE1pMfah6p6XyzVmBn89422pbf3llEqH6ZpoiQuXWbURyfYgQHsem9rXl6UmM0gOkT8U9Cy85/TgKvGBVduaw0Kj7vPjVjoBg3CqM2Av67Y5K5en0GIYwcfCD4Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+R7wP6R9b6lDW31um6QH87ONDJmf3E1rDYEj0MsL8Y=;
 b=vsb+HWjikJCmaFahxCYbsh2+i3nuIyzH13GCnBT7tIoTTXyOdYZzExXUVifUgC0x0rMpM91vm+ixhqeNlw1+omqVs/FR9uRZUgG3zKPkNWp7IGFuu+zfhNtT+SgS3LIs33rdh0/yZSyWUiOmbav3CRzlD6vtW9Iu7XSGnXPapr+JNwgNOW8tbzFG6vHhbGGva44Y6o6DRQBh6Z1Re5k2V33s0C6WMWG3ez/jREcSQNvFNtvBTAEMQFQXLfEWOn9BFKUj/mjIw37XiUVlbwz7zYjuuRdN2HqOsF8VGvcvl1/YkqykLpk+FSrYAPXiK0EOkSjFSz3nOwKusZQ2BmfZVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+R7wP6R9b6lDW31um6QH87ONDJmf3E1rDYEj0MsL8Y=;
 b=hdFsu+BmUp/Mse9GJBLO8Ho+/RqrXizpuwJ5IqLedp/ERt/huagybGiVMSUKN5UVQ7ALl3xq/63IyGUZr17FmfCPE3q9fmuZkEvdtzBGU9KU+rjWf/2uqhFO3H0iQjtZ/8IOlhmzTX0YL1l9msefBICC53LpuAmPtSa1VZG+NP8R93UfrYSCiaIbL+vRzhaLjZ27VzUTk4rh+FDc2m3jGHLN6fxIqRmmBqv+I+Dza8VZ38fOXQW0Glc9edm2dx0W7wihgSoPgOuLmSv5DBT/9xXV9+6r7zPYkrxBG69ATvQXhfaFQfWj9g7uX/qEKlX0fOwQt7jweGy9utyTo4yKcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PR3PR04MB7339.eurprd04.prod.outlook.com (2603:10a6:102:8b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 11:44:25 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 11:44:25 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH v5 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
Date: Tue, 26 Nov 2024 13:44:11 +0200
Message-ID: <20241126114414.419469-3-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126114414.419469-1-ciprianmarian.costea@oss.nxp.com>
References: <20241126114414.419469-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0276.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::15) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PR3PR04MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: f345a0a0-1c66-4cc4-a946-08dd0e0fad23
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0wrdW5NNWxjbytvbENLbWljUGdNUmN1bkl0Z21ZWHhkQjJ3K3EyV0JoL1Iy?=
 =?utf-8?B?YzgyMWJYT2xhWXFScXZqY2UwQ1hnRWppT2pMbXNIV2VmWDgrWXVocHYzZFBQ?=
 =?utf-8?B?UkgrTmYvY0FFZWJVNy9iTGFpZ2JZb005Tzd3OGVQQ0o4clIvRU5NWnJ4TjQ2?=
 =?utf-8?B?TDcrVmpxckJ1NTJkZmp2MHBTckNLVW1SeGhRMmxzSk9OVUI3VjBNRTRPZWZa?=
 =?utf-8?B?TE9xVGZoYTUvVXpsSmExTmg3dnR3dFk4UnM3VzViNGhPeU4xV1JlNm5HNndn?=
 =?utf-8?B?V0F3OW1GSnhBN3FpNWkvRjI2TXhsRkV6Yk1iKzFqanppS1B2dHFZeFZYZkRz?=
 =?utf-8?B?ZStoK3REdkEveG1heHR0VlNtN3JUd2xxTzFHU3RaQ3R2RE1KdHZqN1NCNnVr?=
 =?utf-8?B?LzBFM2pUbzdZWGswMHptQ3BzTDI4QWRBOTlXa0xEZkVkZE9VTjdncktIVlJs?=
 =?utf-8?B?LzMyOG1nZlBVY2t3eGJyNXcyZkR1SjBvdncyQXlrSzNVa1dFdkVkbFRvSlVR?=
 =?utf-8?B?c1NQK1ZJVDcwMk5lTkE5M2xXRWpGUzRYdEV4Ykx3MDFrQW9DYnljYWxMdHFC?=
 =?utf-8?B?SkgzUGZ3MkhjOGc3MHc1cEtJbHNQaVlRb0ZDZENnaVFZa2sxNWVSYVFndXlu?=
 =?utf-8?B?elJKTFdlc2F0K2dETE0wR2JDL01tN1hBaEhvbVNhRGF2YjJOZFI5NkVJN1pa?=
 =?utf-8?B?Y0ZwejJ2SVNCeWpGWmNaM3RSTm9BeERDSGNleXJuM2NwM2dHMHErMlkvWE5C?=
 =?utf-8?B?WnhkQ3BmWFlQUDNjdlFlUmg0NVRscWZPR1l5eGU3TUorQjVBbnNYZVRjM0RX?=
 =?utf-8?B?Y3JiWlMzaENKNWJUYVo3bEFhVDNheUpLd2J6dlhjYlpvdDZqb1l2cUJzRzNj?=
 =?utf-8?B?cnpXVkZ5ZWptMERlVG5obkhFb0FhWS9pbzZvRm5TQnEvbWw5WWxpOHl4U05q?=
 =?utf-8?B?eERqOXdyNXRpOFdKL0VNYlpuQjUzMC90aTJKZ25TanZTWldFeTNUekVhRkdL?=
 =?utf-8?B?MmJNenYxeSt0QVVEa1pIYkQrS2VKSGNHSWRVNDJ4c0kxT1N5Ty90ZFFRM04x?=
 =?utf-8?B?UlU0eVZFdWs2STRyVVhkOGtKdjJMVld0eDRYbVRXRGtsc2k5OXlnbHA5UWg0?=
 =?utf-8?B?WENLZFFUelUxaXpjRDBnTFFOamkwNlZUVG9DR3lnaGJESFFrME9vc0FhaFAv?=
 =?utf-8?B?akwxc2VEa3lmemF5RlkzamE3azVSL3dnWU4wM2ZVLzkyREJhU3NxR1pOdVdZ?=
 =?utf-8?B?Mk43ODI1cmw4L09LNHZTV1Z5OFBUWjBCNVZpV3hIeWdoRTJQQVBkd0lDV045?=
 =?utf-8?B?NWovWis2Yy9QZkYxV1p1VGl1WDBxUllzVW9xSTdONk5tZ21DWU5kem13Z2l3?=
 =?utf-8?B?dk9MOGhkTkdCeHo4WURQRmVhRW9keUtIa0ExM2JidXJHdkZUZXJUWmxpUUJo?=
 =?utf-8?B?VngzVUZLK2RRR3NZK0hmZE5lVUhLRTZuK2hWeFRWcEVLczZTWjdSVTV5Yy9z?=
 =?utf-8?B?U0ZZb21CWkFaVFZUa2IvM0Q5NFNvU05xVHI2eEF6MXc1MHdyK0lDNFlBdU92?=
 =?utf-8?B?WWtiMXdrbzVlbjB0Wm4wVEN4N0xhVVo1ai9jdk5MZnZ2MThseE8wSlhEbE40?=
 =?utf-8?B?UXFubWIySnJIN1EwOXoxQnFCYjJ0T25DZityYloxb2ZRMUJQdk1BZHRteWNY?=
 =?utf-8?B?ZGVIU2FRQThTdlR4QW15NHpmYXR3bTN6U3BUamE3SjNWZkE5bjNYNWh2K0FL?=
 =?utf-8?Q?YWF7yGFNHfMAyKUvhvcUNyJD6NNnRxETfLEqZGa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmQvN3ZLMC9Ua3VrL0dZSEZHenRBSk1LV1pEYjhiR0dLeFJMZWkwalJyZmJD?=
 =?utf-8?B?aFE5L3FxV3NDSE0rVmpwUWdUaFdSclN2dEFCdmc2dVlOajFpNFQyVjQvQ1pk?=
 =?utf-8?B?YlVNZFJ2ZVhyWE1jeU1yTWJ2VmVvUlgwS1VNZXdDaUg2M1F3VzhUc1lxR2kw?=
 =?utf-8?B?N2lrVnVGV0JpMVl0Y1hQTnNPdWVacjVJNUNIb0t3bDBadzhvUHc4VFh3b0NG?=
 =?utf-8?B?dGpCc0grblRJRmVxZ0IrVUZScUxDS2ZldWV6Nzl0LzUrTEk0dUViR25jQjRE?=
 =?utf-8?B?S2NNYlFFTWdZUFdIZ25rSlBvSkRSaWtUTXk0TDZxUTN0aVNRb3hFZHlIbDhY?=
 =?utf-8?B?M1Q4WWQyMW9kUW0zRmMxUmJ4cnBuS0Y4eGNleGtuZGNKQUlzNzZYSjhTcTRp?=
 =?utf-8?B?U3BpcGVQQjk4ejZobmFDUHJIOUE5eHpNc1VrN3RTazR4dWtLWGJld2hQb2dN?=
 =?utf-8?B?bFRiY3l3S2U1dWVGUnJpdGVZRThFSVRaOWVxbDBsMmhJRnZyZ1djNmo0bmpt?=
 =?utf-8?B?cmFqRWlIU2Qva2gxNjdLaW4wVVQzWGl3R3lZQi9GNFRXc1lrb2lIL3hUNlMw?=
 =?utf-8?B?UnZJSTY3NUdZMUhCWTI0UkMwKzNaRko1bjh4VElUY25pczhReVkrZkN2eWtL?=
 =?utf-8?B?U3RGVFFJNE5ZUGJqQ01TSWVrdndXZjRCVXNzMGtuTS9aUDlDUEsxQTZHWElH?=
 =?utf-8?B?a1V4cC9PWTZ4d1phb1pvS1RBT095TFR3a1BxcHU4TThFenVvb1RjQnR1ZHBH?=
 =?utf-8?B?NW1UdkxocFdrSkxzbVYvSm13VWRINE1UYS96dEYyOEt2K2FWWjZqYkdBNmVV?=
 =?utf-8?B?dCtwZ2kxRFM1NUhGV3E5cGlPWFIrQzBMOExEZVUwVFhSYmZkNWRVbjRnNUh2?=
 =?utf-8?B?cE1tUXVmcmFMSHIyZTJOMWsxS2JoN0gxa2VBTVUzTjJ3L1NQY2txMEI3RVVl?=
 =?utf-8?B?aTJDTUJucFFBTFRadUlwUkJrRWN2Y2VnSkRVNUlCTFAyV0l0VFBINWlGTkJl?=
 =?utf-8?B?L0dLWHM1ZHdaRzNCcDhxNUV0bGhSYXljTDlBN1RRTlpVajdNTElBU0VnZXZa?=
 =?utf-8?B?M09qZHBINzFnZmplR0E2Z3h5YjhLUUtzQWJhQkRvaUxkZSt5RWlMbTdtSit0?=
 =?utf-8?B?ZGc0TmFoQzZGNmdDTEVDM3pSeGpnNytxY2grVDZIalVCaE1rdnpEQ0JITVVK?=
 =?utf-8?B?NnpvS2VzOWF3SnlrK09yU0ZmMmJ0cGxpVmxKTUJEQkE1b3ZtRUg2RElLeUhj?=
 =?utf-8?B?Z1RNcytReWJwSFhDU0pud1FXanlrMGJYdUVHbllyd3pZOS9hdEJ0WjlMK2Mv?=
 =?utf-8?B?WWxZMEFWZGFPNms4MXdhUjFNVWZIdEk4VUs1Qk9vblBvbEwvUHlSSHdWdm9K?=
 =?utf-8?B?WFI4ZnF3YmR5bVVZQi8zcVZKdFhRSzh5K2hEWC9kY21Ra0RneHZYTm9DckZE?=
 =?utf-8?B?U3p4cllySXFBQlRLN0VHQ3FVYzBFaHRzVTFUTFR1WVp1NUt6dDNsc1VhLzJo?=
 =?utf-8?B?S1dwd1BMZ25MRm1GOEVlTkFoeWZ6YjFNa1oyZm9ObTNXM2xzZUFMV2lLVjQy?=
 =?utf-8?B?VUpnanlhZkFiK3hRd2NpQjVQQVdVR3liU2hUajVPS29OckxURmFnbXZmVW9Q?=
 =?utf-8?B?aHRDOTRueG4ydmlIa3QwY2R6MFFUYXdGVVJuUkJ6cm9Za1JKc2xNNTZYcEJN?=
 =?utf-8?B?L2g2algzZmFSQlNIZEo4T2pCNE1QalNCb3lCSXhLclFHeDhra3VjanJoUER4?=
 =?utf-8?B?VVU0K1ptZjRUMzQ1SVE4L1hYMGJZcjhZQ0Z5dXV1SmZWZ0N3QmtibnpzTnZv?=
 =?utf-8?B?OHJFcGhybDcwNWtkcjZPOEhTK1RBNFhzZHlvSDZEOU16R1FLZXFWY0xJU2h4?=
 =?utf-8?B?UGxLYjRzQ1g2MWZRbThwcmNNTDRxY0lubjQwVzNSeDJTMUsxMm1kaEN1Mk4z?=
 =?utf-8?B?YXFWUE41VTFwNnlKNUlndkI1WnZZL3pSQmtwV1lqMUVQc0NXYlZjSGtaaGIv?=
 =?utf-8?B?RElGS2kwWVQyTFA4L1h6cGIyeG9ER1VySUtOcmZTRFVEdmZOelRjZU5iSHVK?=
 =?utf-8?B?ODJqOVQ2UUlaY0k5N1pIOWdjeHBzTTB2NXpNbWh0MkVMYnh1ZzlMUWJxVWRV?=
 =?utf-8?B?V01xZ28yQkFDVkw3UmRtbG5RQncwK1owbEhQa21tVytwSlN5YU91V2t5aS9D?=
 =?utf-8?B?V3c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f345a0a0-1c66-4cc4-a946-08dd0e0fad23
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 11:44:25.0898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NpCIaYNrWv67hvIcZ0z1ZjwRhmIJ+4D0ORHOVsMULsz5XoxZVDk2o06l7tfcyaVUCh20pfI9dAjI+KskDpa8Ga2/BTGBpnrj65adLYT9gLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7339

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

RTC tracks clock time during system suspend and it is used as a wakeup
source on S32G2/S32G3 architecture.

RTC from S32G2/S32G3 is not battery-powered and it is not kept alive
during system reset.

Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
new file mode 100644
index 000000000000..89414a0d926c
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nxp,s32g-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP S32G2/S32G3 Real Time Clock (RTC)
+
+maintainers:
+  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
+  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
+
+description:
+  RTC hardware module present on S32G2/S32G3 SoCs is used as a wakeup source.
+  It is not kept alive during system reset and it is not battery-powered.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nxp,s32g2-rtc
+      - items:
+          - const: nxp,s32g3-rtc
+          - const: nxp,s32g2-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: ipg clock drives the access to the RTC iomapped registers
+      - description: Clock source for the RTC module. Can be selected between
+          4 different clock sources using an integrated hardware mux.
+          On S32G2/S32G3 SoCs, 'source0' is the SIRC clock (~32KHz) and it is
+          available during standby and runtime. 'source1' is reserved and cannot
+          be used. 'source2' is the FIRC clock and it is only available during
+          runtime providing a better resolution (~48MHz). 'source3' is an external
+          RTC clock source which can be additionally added in hardware.
+
+  clock-names:
+    items:
+      - const: ipg
+      - enum: [ source0, source1, source2, source3 ]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rtc@40060000 {
+        compatible = "nxp,s32g3-rtc",
+                     "nxp,s32g2-rtc";
+        reg = <0x40060000 0x1000>;
+        interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 54>, <&clks 55>;
+        clock-names = "ipg", "source0";
+    };
-- 
2.45.2


