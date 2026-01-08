Return-Path: <linux-rtc+bounces-5696-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2116D037C0
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 15:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E90C93035332
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 14:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E322D470F21;
	Thu,  8 Jan 2026 12:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="I6Rgzg7S"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020078.outbound.protection.outlook.com [52.101.84.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A37C470BB2;
	Thu,  8 Jan 2026 12:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767876710; cv=fail; b=UjJeE3n/TLmHWdApJF1qHeKdLve3kxPxMNR9TAs3ikhfanCdckwwULtrLEbLYY6jXX6UrpRqAutTzqXmjYYKpa22AKXfXTfqcs7zAn6n9EOr+gAkXMbZEd0jitShXTYa+FcDUdSxhXAgb6/oXViWgBNl6KtmrtDGduymUiB8cqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767876710; c=relaxed/simple;
	bh=xcJHTcEfCXb+jBRkFyOSoli47+jFhjgrbnMTeBvuVkE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fRGSuUO7+u7W6K84JFfERvpgjeFNBxyTLF+Lz/ANwgehcGVBljcX5Z6reIXRRynaNRkfA5q49kddykr931+CABeul0Pj29aLl3t6llguJl1EXZFTkqtJAj20zvsU+15Q96ZnI4gUGxEXfHAuCXZJZsM3qBYSm7xVM9HSLSc59fU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=I6Rgzg7S; arc=fail smtp.client-ip=52.101.84.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ORnrmgEXWc+x6rZCmF2DrVqeIZj1HktlRlJZaY3Zmi1ZbKpaIl4gXuGkpRB1ToGlyIL19CS1IA6HrZJsv8a5s9G4q9Yg69+7GciqT9Wqivf94YQYQLykdJucviGncfzIRs1pxbm1QNrFObZ0Gd4U40xN7NVkEiSX1LuOGa/qrzrUCmy216xSfZ7Ght9WKG+W5NGcEyVU9TD5gu8YSgktiJXPIZpKPq1KxMc9opwhuDffWNj9Q8wX6WHrHOe7WUW5hOeaottYO2w41Zq6S/bHmmmrKvb7F7ZANoLW78O1TbXrhp+BGMZx9psCCOvJIP7/ZSPPVhCVtUrxJ8X9JSdsYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBFhZiP5Y1rc2+q6LJMyKBdzm+wX2wim0POeSQ12yRA=;
 b=gWMUSNjVUN3wN8ixZXGnGcCuKRMi+c3bnmW5gYQuXb1lPXCi2ZU7SvA2B11AM2geGjZkf948u/neyZRtRtKVL5HY6cT0JlqYWANskOm5fMzChk7VoY4YmI1Xc9X+kG1tXPLd3tUCI0EXlm/dvsbPhVgglGKqb7hUobsP19lg1iiJ9LmWrw/WQz1pi1KMO1wIWxhoCXifh4ObPHnv+/Nx8mv/JF9JlUIeZjQTLX0ySjtd1QHsbYWXwnou0ewg9EGaUacbL69FiQYj7UTwtzj/FQqvBnnYfbRwi69neoTTlV8zEIqnQO+3W+NCKdNajpeblZClS5NIBfI3WCPyCj5Rqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBFhZiP5Y1rc2+q6LJMyKBdzm+wX2wim0POeSQ12yRA=;
 b=I6Rgzg7Sy6RREWkZWu8hP92wH5EV1PPt7uBtdCAZE0/hBX/jKAOBGR5kHAF11hRPxBD84Fq7XLIdl8pAyfTkN0mPDryH1YIlTazzu2gIX6BYIWk9aiarXvcLSWAj56EcfU+PIt1/QS2YNzpb8b+BL1lBjISrhkpTO2RNlhO+Ln7oigycYAyup5dNAfZj96IE3R/7qaO4fZd/zdT/SiHPiQWK790YnPWkILUrOjPWMZyufjA6LJnWOgzsRrrJP8gaph/pt7cB0b2rDueQvzhTp4f/tHRcn3rwiirJ8YsuUQsHvuyYtGGrjc/1+YxPbUC8iHUBc6Hs6aqteNPjpKjzAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by PAXPR06MB7456.eurprd06.prod.outlook.com (2603:10a6:102:151::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 12:51:29 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 12:51:29 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Date: Thu, 08 Jan 2026 12:51:16 +0000
Subject: [PATCH v2 5/5] rtc: zynqmp: use dynamic max and min offset ranges
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-zynqmp-rtc-updates-v2-5-864c161fa83d@vaisala.com>
References: <20260108-zynqmp-rtc-updates-v2-0-864c161fa83d@vaisala.com>
In-Reply-To: <20260108-zynqmp-rtc-updates-v2-0-864c161fa83d@vaisala.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomas Melin <tomas.melin@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767876686; l=1367;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=xcJHTcEfCXb+jBRkFyOSoli47+jFhjgrbnMTeBvuVkE=;
 b=FZgXQvliZQmlS1TRj8O0CPydVoufSGUWZoqvyZgJYfcmGBjCgfibaFyfTrD7VmOBOZAbUuRud
 B27YoXyFzq7CFfhoqxA5oZlsNt2KPUeFBOmK5PqXBMgH2AtZMQ2jjIv
X-Developer-Key: i=tomas.melin@vaisala.com; a=ed25519;
 pk=6lMiecjZ+OeyZuxYsDm/ADy9D1JKvYrKdsYv58PMepU=
X-ClientProxiedBy: GV2PEPF00007567.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::3e5) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|PAXPR06MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eab42b4-4bbd-45e2-082e-08de4eb4a434
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VlZrZ05ucE9PL2psYXVRQlVNV3V4azVHVGhaTkJCYTFhTFNQTDlUcitGY2JZ?=
 =?utf-8?B?QlQrMnRiaE9JZHhOQ2F4WHpXbmkxY014VXF6VVhvRjNkNHpQT0xRWVNZdHlj?=
 =?utf-8?B?S1Y4MW5lSGtuSVhyeEp3MXRGbEVkQUh3eGl4NkRoRHlYTzNJcHJJWS8wUTVh?=
 =?utf-8?B?ZTQ4eFp1d2c3dWtRQURYN3dZNUc0dG9vNXlsUVVITG41VW52U2xuVXJXRGNK?=
 =?utf-8?B?MzhwdU5xNXR0RTIwa2I2U2JiYWNnTno0bVVDcmRGYU1rR25QV3NSQmV0cVRW?=
 =?utf-8?B?SDZOelJUSW1NcmZWc3JRRm03WWNGNEVxRHVXTnIvOFFTWTFHL2RQc3FENUY1?=
 =?utf-8?B?K1E3M1RBRjRVQWRDcldrSW5vTm9wd3pkQi9XM2NIMTFGQkpNUm1INHo0SGZO?=
 =?utf-8?B?TmZaTXU1dkpwTmdqNzlqOHozZFlFWU14b08wdDZNVFBvdk5zekpJdTNURVBQ?=
 =?utf-8?B?ZzRjTWh5ZGNMZHhlS1F2Z0EzL2w1V0thTzJQVE05ZlM2WVhlQUFYRUNTOWVo?=
 =?utf-8?B?V0Nvb0lrN3lsZndZaHVOMVNGZXpJK0JJZENTcG1KVTlBVHd4cHFWSHRLWU95?=
 =?utf-8?B?TWRNNnBMNjEvQU5uZzdESkpuUWRqTjRlZzhaL2kwR1Rtb1pneVN0RTJBOWwx?=
 =?utf-8?B?VkNmWHNXUnVsbWUvelV1ek9uYk1CRlIvS084dzFoa3NkbkRNYXlLem9EaDRV?=
 =?utf-8?B?aXpjaGVuL0tpOFRGdUQ1WXM1MUhlcHZWNW9MMHBPUjRZZnE5MDdFdng0T0l5?=
 =?utf-8?B?NFVhUU9ZMmdkTjJPdXBqUCt6eGlyOFNvUDhaRVQxNzJWa3ZqS05VeU1QVk5M?=
 =?utf-8?B?M2NkS2RIUW9VNS9VWVJMcHlmR01HU2l5d1hxSnQ4RHlOYVlTTTZSUXg2NDFE?=
 =?utf-8?B?OXhXZnQ3N0Z0V1M1SGQvaFlmdTc1ZnRwVGo2VGRTc2J6elNLOWhic0F1T29K?=
 =?utf-8?B?dGRZV2RSVU5BYm9GbS85VEU0OWZpUGlZSjQ2UGFDQ3IvSlRQa21rZStHMG10?=
 =?utf-8?B?aVNoVGtFU1B0bklScFJHRFFjQThrMWcyYjE5WEV0TERHdUpuRGZ1ejIwWGQy?=
 =?utf-8?B?Q2hsRXJJeGl5VTdtWXpmTmZQTHN3eXVOZVkvMzhDN2h1bk8zc1ZHcWtWSHgz?=
 =?utf-8?B?MExHejFUeHgreVJ6bTRBN0lIV091N0Y4UXZndHBBVkFFWDZCdDFsd3MrbjNH?=
 =?utf-8?B?eVlXR0hQS2NndkIzZ2lTT2ZKVzg2Tld3NVNyZUk5QzYyYVZBN3d5Z3NhZmdx?=
 =?utf-8?B?NTQwOUlJR0d0TzJlOWozMERVUWN3K0ZWSW9TQUZob3l1Y2szeHJBbVZybHF6?=
 =?utf-8?B?NHpoUnNGZTVLWEhHbzZ4NUxMUE1mUFFCRFUvTTVOYWd2ZHdhbWFRSmdVWlhh?=
 =?utf-8?B?c3B5SW03c1A5NEZtTE1sOHNKUTBvQVhza05mNm5nenIwMTI5bEZaYnpGd1BD?=
 =?utf-8?B?OXpBdlNlQjdmWUFUWEdqZUhQQ0ZVYUJZdWowdUdHaG1UdDlJQkRRTk5ydTJF?=
 =?utf-8?B?WHE1cGwrMDlYSXFMU05jYjRhcHhHS2sxWS9JeEdkSTdlMytlcHJxYXNFNldJ?=
 =?utf-8?B?ZEdzVU16U1daT05QcDB5YzB0cldoN2doaUwyVWdMblFJcFJFNUtUV0ZXc2oy?=
 =?utf-8?B?NjNEaUFCbWJMbTZibHhJNWVVMzFYZ2FxYXZkL0crY3VNUXVpV1N4Uk9yM3pO?=
 =?utf-8?B?YkRmR0s3dUgyRnNLT0QxYmtJL2ZEeWJoTUh6WEs4REtteWJnWWwvWUt1UzY1?=
 =?utf-8?B?NUh3ZTU4SzE5LzdLUlJEajJ4aUlZdXVnYVdxTUlvTkhsMTE0b0NJR0hCN0h0?=
 =?utf-8?B?aWRjcExySmFFTk80UjBLa1NDV1NFSzFEZTFjZENsdzVaSC9NNmkxZWVNUzlZ?=
 =?utf-8?B?UkRQOW9DTlE5dG9GeGFTQU5KTEFwUXhtSlpvNGxEYi9wcUdBRU9DVURVd2dy?=
 =?utf-8?B?VDNGOFVCbk81VkZ1YmIyNlZ3b2pDelovdk5xVEtMNldMZmVFU2NIcFZmMjQ1?=
 =?utf-8?B?NCs1Z1lCaS9lSHVxYU95Ujc3Y0NXVzlaQUtHOHN3ak1NdGt4QURtSGpzRlNs?=
 =?utf-8?Q?se/UIu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QU8wRk1ud0FlNHkvc3ZFSzFGb09pbDd2OGlFOFU3WGR4eWV4LzBuNG9GQThL?=
 =?utf-8?B?Z3dLNGNERitqY3NIQUdwUE0rL3REaStxSkJMNFplY1RTbjcxSHp1N2lwVWRX?=
 =?utf-8?B?OU94UDVCZG5uT3dOOEY5emNGeTMxdGxhdDJNbkxFektWK3BrVHZ0TXVoRHNC?=
 =?utf-8?B?YzBtb0JFbGhRZmE3SzlsU0x6N2xnTVUyMTFwbWpTczNNSnRFOS9jQ2h4R1kr?=
 =?utf-8?B?OFRBZ0RHRzdyczZwTGRmNncyV0ZLdmxFenVXc3A2QWNBL0Y4eXVxTThnb3Jw?=
 =?utf-8?B?WkI1Y3hoVjNlZVVkN2V1YUhYdy9qbjlrUkJxOC8xQzNTYjVtdkhVSWRvS25q?=
 =?utf-8?B?TGlXYUVIcnEwUGtWZW1hQWpLV0tZdVgydlhrSGtIalcyNHdoZG96Qmk0Q29N?=
 =?utf-8?B?YjFHVDRwellvbEg2WUFWQzIwdDAxcFVhakNKKzVyY3BkL21GcjlySlFFUS9Y?=
 =?utf-8?B?ZTdjQTVJSXdzaG1tTHl4SnVXT3ZZRmI2N1JwMGxvWm5lSytvcnZIRnk1bEVX?=
 =?utf-8?B?cDE4R0VlTEltRHdsMktENDNPY1RSS1RHQ1pZR21Ua09pSUxxSXVLRkJlKzR2?=
 =?utf-8?B?SG1HZ1NRU0gwRFBPa0hxeXZzaGRYK1NjZ1UyR2FMenFyWEc4NkpiWFI1RVZi?=
 =?utf-8?B?RGdxL244ZXVzVWxuTCtSTzlMYkJJNDRBekp4TjF0RHlwZjRUNmtZclpSdmJN?=
 =?utf-8?B?SjlheHJYV3VrZHBxWWtqMUdMNlhvTFNzWndyNjJrNDVGSHRNaDNiVnpBRi9T?=
 =?utf-8?B?UEhpUE5zY1hPZzVjMU1MT0txNm8yb2llblJ3MC9BcEFQZXZ4b25MZFUxc2Vj?=
 =?utf-8?B?SFQrWnBOYmxMaFU4c0p5c29raEdTQUpobTVBQ0x2bGlzMGZ4K0NFRDZ6MkJT?=
 =?utf-8?B?TGJsdnhZOWlFVjg1L0hhbGtVSXNJS3ZXRkFwNitqRXlsb2J5RDlpVWZCWjM3?=
 =?utf-8?B?alhCQnFNNlNqWXluS2hUaFZwNVJIYlF0MGk5a290cTFVbTlDWXViZzQ1Tm16?=
 =?utf-8?B?aGIzd2w0NUNlZFVsVFZwVi80U3dCZ3k4Uk52NlkxSXA0MldYamMvYVE4N3Jp?=
 =?utf-8?B?TDNGK1pUVmlJdy9iblFhMjkzUU1Ud3Q2Wlk5TmErSnE3NnBmZEVwRjNkVnpT?=
 =?utf-8?B?alk1dStpeGQ5QmRDTDlJYWtrQ25oV0IrN0JYbkl5M2pNYXl1L042ZktHbXRh?=
 =?utf-8?B?M3pwSTY2amhWYXA5V3FpeFdockZuMUJvMWdoOENqWW9LYzBITFovTVVvUXRP?=
 =?utf-8?B?Yndwc24xZjVWNlpOK0tMcjhBRW9yaEZQZFM3Q1RFL1J2dU9lU0xuWnhrY0dH?=
 =?utf-8?B?dnYrcmtMd25wNWllQys0KzVxVjB0Uzg0blJFV1VVRDBRT2tqNWRIRTEyQlVF?=
 =?utf-8?B?ZHlYUlNSWXZWZmVPT1lrU2lCVk42RnN4Si9OdTZ1RDFjUlpoM3RTbkdaaWYy?=
 =?utf-8?B?SllGVXlkRmNCNXhNb2ZGY0QvZ1JsZCtCeFJIbHVSWHRhbTQrYmttZkJrVG1t?=
 =?utf-8?B?akc5bmwwa1BjVE1MdDFFNkRDTCs3MVRmMC8zMnBUQzNMSHlRRlZBQWg5VlZr?=
 =?utf-8?B?NXFIQURNSzF1VU9CRHJKSkxPc3FzY01SL3RYbTdEN3lPOERUd2h3RUV6T2ty?=
 =?utf-8?B?ZFArQmJteWZxaFRhQUJja2MrZS9Ec2tuY0MwbU1WK0FNa0RHTEwvdlFkNjBm?=
 =?utf-8?B?ZndRdERQUXd5ek1UTXJaRThhVE90bitTSTljdWltYkprQkRCTi90WDlaSGtP?=
 =?utf-8?B?TnBveW9BWTdpR1JHOVVCMSs1akduRUFTM2hPTWtjT3RRZkdNalJYTFQ2N01y?=
 =?utf-8?B?VDE4QmZtSVRKR1BNR21jOFB0dGs4T2gwRWIrSU1LS3poUmhXNXlCWUxTVmFY?=
 =?utf-8?B?R3hCeXd0cmUxdDVsNEdZUUtqSHRHQ0RkUXZxWm1lWGJQR1dqVXFiYkhXeVJG?=
 =?utf-8?B?TjFKUWsyKzBZbG14RjMwQkpxQ1dvUGxQbUpsaHc2bWVhZDFNL2RYVnBpYU9X?=
 =?utf-8?B?T0tSa2NWZ0VpKytUTS84RUR3b1RkUDd4VFBWS1R1cFIvRXZ4RElJaE5Dbk9M?=
 =?utf-8?B?ZGhZWG91VDlEbVdGb0JtVFE0d3BzYnJRaW1HenEzNHFwUzNFMjhvNjhWdmNy?=
 =?utf-8?B?ZkQxWm5yaEM0TmpCOWw2N3VXY0NoWDZmQ2dQVEZRNzBrbFRMZm1lSWZrWTBU?=
 =?utf-8?B?elpzbnFwSUsvY205ZWxxZzhXSk9YQmN0eHFiamx0ZEROZm1NSXdwbUovelVV?=
 =?utf-8?B?empPc1Rac0pySDlaMDVPTHdiakhhSEU5Mk1DQkYrNERuamlNTlMyWUU3WCtP?=
 =?utf-8?B?aDdQK05aNU1NL21RYzVCK0RsbGsvc29yMEk4b0tNRjVBcFNmR1dxc1A2YWNa?=
 =?utf-8?Q?G44BaW+qbPYNuHbg=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eab42b4-4bbd-45e2-082e-08de4eb4a434
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 12:51:28.9980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0FWhqpLoDbvGOf2fM84P0QZT3e8QwqXpHFxeJUS1ihuJ+FbVLAp6LpX2ad42ROdms2ZmW5zQIW4A5jJVgL2ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7456

Maximum and minimum offsets in ppb that can be handled are dependent on
the rtc clock frequency and what can fit in the 16-bit register field.

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/rtc/rtc-zynqmp.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index d15c256e7ae56058ddc38849af6424cd29b8965e..f508c61f4046e906d9569cc779a1360474a85fd2 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -44,8 +44,6 @@
 #define RTC_FR_MASK		0xF0000
 #define RTC_FR_MAX_TICKS	16
 #define RTC_PPB			1000000000LL
-#define RTC_MIN_OFFSET		-32768000
-#define RTC_MAX_OFFSET		32767000
 
 struct xlnx_rtc_dev {
 	struct rtc_device	*rtc;
@@ -215,12 +213,12 @@ static int xlnx_rtc_set_offset(struct device *dev, long offset)
 
 	/* Tick to offset multiplier */
 	tick_mult = DIV_ROUND_CLOSEST(RTC_PPB, xrtcdev->freq);
-	if (offset < RTC_MIN_OFFSET || offset > RTC_MAX_OFFSET)
-		return -ERANGE;
-
 	/* Number ticks for given offset */
 	max_tick = div_s64_rem(offset, tick_mult, &fract_offset);
 
+	if (freq + max_tick > RTC_TICK_MASK || (freq + max_tick < 1))
+		return -ERANGE;
+
 	/* Number fractional ticks for given offset */
 	if (fract_offset) {
 		fract_part = DIV_ROUND_UP(tick_mult, RTC_FR_MAX_TICKS);

-- 
2.47.3


