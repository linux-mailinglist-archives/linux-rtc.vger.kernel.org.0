Return-Path: <linux-rtc+bounces-3760-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B23A7A10F
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 12:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA14F1702E1
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 10:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D452E24337D;
	Thu,  3 Apr 2025 10:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Gm8NLtDI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2050.outbound.protection.outlook.com [40.107.249.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7BF347A2;
	Thu,  3 Apr 2025 10:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743676443; cv=fail; b=CbZm+fzoXtGj4SS09F8fB0AvmPo3d2dyuAsv/IkO9nKAyRhBn6nOVv0p0LA4v4ItpkERMRghTjGhj8JrWzk8w4krs2w70IwU63Jfg5IzRSCVdI70BUSOjdmFnS4ATqFiqNq7JRtseo6TLKvzT4tPgX93CVMPGupDpojsXc5HY+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743676443; c=relaxed/simple;
	bh=OelRowMual/JKhfgpEdwCiXB1AOp7/F5HAylD5m0kuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p9+eh6FTo0IzwbBUP+AvdSwmZyYjtBCmWdRxg7O2n4gvC8+63t1sgius7lGrzMFd9iD29HRj1Y2nuKuDznBrYwG16ELG0WRvjOWpN2iNbSCwH3ZpNRGeVdz/T/7c1SSZbChhr7Ep/cIm+4dEix+zNCGxaGtV/oluF1q9wdvX3+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Gm8NLtDI; arc=fail smtp.client-ip=40.107.249.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDuy+pwD5Z23R++tslgpqEZHvNfIA7FeIelpnsaL0Sde4JYm1ofgQxg9DiwIWmCZqJYfzrB66aYjnfKGDLipQEKznZs5cKomDxn/nGLMkrmxAyimW+H1Z2nN+Ye9ctxLFG+D/RPHDN1Z70UNMFDtjxMlefnX+25rzUnU6WaqE0wosemnVJftcT37B69BLU23UpbKfOBBKWouUm1on3jk5chsHlGdZCZdnQECN+ph0S3Q8JFiH9vdtWjEttslluB7h30u6omDGYCIFYas9Fb4t4/2qoqFGC7IzAK6F+jRvBDzXg9fthO7E68NXelqb5YtBF4/k7Spgu6Xl+H7qOIOHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UvKplru0XYC4azUPl/dSWB9rmpGtBlHZRXHnW2ITD9o=;
 b=y/AL4vNETTBBMB9R7VN+hvybFL3SgKZK/wj56/bqk4XRkGiraB6UTVSJwuY9cYjq9h0XdRcIHEetQdVNlLBI+tTj19a4G6n/3zhO29SS4HPy4BSFLoo6rMjmFD/8GUjQBe0aBurtz2l6L485XiX1AHFPkfSSR/d7uXtZSuI2D6OF9DNt5f1EBrs68RiwLOkhMrjGKoWm3R6nVw/k0tNRw86pz/dsn/lrN0AYPn5nYVhrdwiQmMxvRYxlvlpoTzN9o/qdSCmVGFX/OkrIE5ZGwR981lZlc7PXNWboF+sRkBNHlcaFg83ywnoxFsW6MbfnoVIFiOqrQ2/PSNXbCYUeVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvKplru0XYC4azUPl/dSWB9rmpGtBlHZRXHnW2ITD9o=;
 b=Gm8NLtDIOCa9DiwSknZ1zR57VsI/X18HJN8rs9APUkXcv1q5mudm16NXyBm3EGfxO7bpNjtMTMF0nPP967x5bnDA8ieqMTgmEsevn2FLkTmpePJPlrqvk3B2y+8H8tmB+XQhiBK7fuKUuHQv6lgt3pYULKwpwYQ3KgxCPp7OEBAuYqNKwilGxCQ15s01nmOerx0g24zJuvuFdGufI5bHbaKO2ALshInf5hej6doTcronwjehZ9uLFfdyvDuWfLQNQiWRLu/7sYJWjU/iuWsSB8W8596GpPH+G9tK9e0ubzplNZWrADRlLMuFWoOPBhgannZ1yMXy/W6VVyqlRvGPNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Thu, 3 Apr
 2025 10:33:57 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 10:33:57 +0000
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
	NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v9 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Date: Thu,  3 Apr 2025 13:33:44 +0300
Message-ID: <20250403103346.3064895-3-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250403103346.3064895-1-ciprianmarian.costea@oss.nxp.com>
References: <20250403103346.3064895-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0P190CA0013.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::23) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|VE1PR04MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: 16226cdb-0c61-4707-7456-08dd729b08d9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OTkyZzlHRVRkaFBBZGd2TkdwWnUweHNMQkpQRHJPeGcrbTZtK0kwRWx6cnFj?=
 =?utf-8?B?d1cyczI5UnozVzFjNDYvTXJjUm4ySEVVcytrSkM3M2c5RkI2TEU5SFhkOUcr?=
 =?utf-8?B?K01OeHF4Ynh6ek10ZmlWc2wvamtLaTlYdUZyOGMveHpTZmRtcUJ4WExSMW5J?=
 =?utf-8?B?bkJ0aGowd2lBUFBuNW9QT3hQRGJoMTBUMGR0djcyUGRETnljSmVRSTRNNGlL?=
 =?utf-8?B?TlphTUw5eGFtTG1SSEVtS1dpV1g1ZmNTVjZ6S1BkVVkzbHFnSDVmazM2UmlZ?=
 =?utf-8?B?M0FpTmkyOXJkajdSM3hIUis5VjA1QklZOVlvTjQ5L0lxbTh5SHQwN3BUNmdj?=
 =?utf-8?B?ajdLenFpbCtBeUlSZHVUZDlXbW9LU0JRYkZrRFhQU0FyZWxmZ2dWNEJsZFBM?=
 =?utf-8?B?OFQrUGFPT216bkNaZkVodFJMT2RWK0tKUW51Y3plZUZUVjJjK2p4NDZObFFq?=
 =?utf-8?B?STkrRnhJMmVtYWcxWEQ5bTlnNEN5NjNYR25uTUVOckVpVnprcHMvM0Mvc3VF?=
 =?utf-8?B?ZWFadUNXeEh5alFyQmJYclZtTEFpTDR2RkpEaWp1OUM5N3M3cVFmUGszdjFn?=
 =?utf-8?B?ZzEyUEc3VHpVaHh1YnBOSjkwRVpQcEllUG5aQ1FndklQTVE5bEUyZDB6QmVO?=
 =?utf-8?B?b0FTeUJvWFUrVVJtbjFkME8yUmFGaVNseUkyUEMvRmV2STh2eTg3QktFdlJy?=
 =?utf-8?B?NmtSdU0waXFucnAvZnd1MmtCRGQyUGcwenJ5WWlDKzl1UlRxcThaWlJMR2lV?=
 =?utf-8?B?S2J5SDVRWVUxNDdkak9BSE01cGx4c2RNVjUwSDdVUVRmd2FsRDQ0WkZEOGZh?=
 =?utf-8?B?ZzJBT292bjRlaTl1dlR3cGxoQ1ZCMXI1bGZoQnpnYXBJZFpUcmpOODNRZmFB?=
 =?utf-8?B?V21FZ0pvdXZJdTE0V2YwQ3dLanh4VVZtMXVHeDcrQzU5STY0czJrUU9ZcVpY?=
 =?utf-8?B?SEh4aENCMEdXeVk3RlViN2xPZUo0Qk9oTU9KVko5MzhPbGJKZmcyMy9RUWpi?=
 =?utf-8?B?TlVUcDg1YU1LUDF3YUlDSmNLMFZOS0JTdDJRbWFWTk5VdnF2eFQ4UGdYaTNo?=
 =?utf-8?B?MUE3R2lIb2haZnVhVTFFdUNraFlqRDc2RkpoQXdGWGxvK2dQc0xROUhKZ0lH?=
 =?utf-8?B?Vzg3bTUvWHhOR3p3UjlWVGpyR29JZnZNcHRmTnZlTmtYUkpkaGRBeUJDRGY4?=
 =?utf-8?B?S3VyWFMrQXpUekJpN25zQUM4clVuZjFWckVTYWs5MTBzRjVEMkkzY1dhRnRJ?=
 =?utf-8?B?YVBtSFZOc2FBM3UzdVVlS2xhYTY4UXJMb3RKNFBWNUMzMGsvSFVEa3BqYURG?=
 =?utf-8?B?VTdaSDZUSlkrT3NXSWs2MXpBZzUxcXNQMlJkLzRyNWlkNUM4N1p6MW9TLysw?=
 =?utf-8?B?am85RTErUzZUWEdMU3M1eW5YWTN6OEY4SllSMlJMR3VyUlJWTTQrMExzL3Zk?=
 =?utf-8?B?MTU2dkpySUFDRVJlTHVVRnk5N1lJNFpGVk9USFdzcUpmdnlGSU8xbjZVR1Fa?=
 =?utf-8?B?TnZZZldobkNzTk5mZTBEQnZnWTJKOGVCeEZSRGY3L2NZcU1oa2NZQ29tRGQ5?=
 =?utf-8?B?eXBKUGFWY1Z3OFZYenI1N0lSUTVCMWlsT1pkdS9CWEcySno2ZitqM1g4TG9m?=
 =?utf-8?B?OEE5UEFzUDlPMjgxMzREU0Q3VnpHKzZDYWJXVUgxK2Z2QzIzSklVcG9ESmYr?=
 =?utf-8?B?RFovWU44QzMvUUFzbFV6bHRaWnBIWWhmMG81dHdXeW1uU2dvVlZSczJDZFBE?=
 =?utf-8?B?bzJLWFNFZjNxMEI5Rkx5M1M2MlZLSDRDZXRrdUFDZXNib3VYWXRRUDR4UEh0?=
 =?utf-8?B?UGN5cENhTjRQSkw0UFdiTllMc0x2clFaaEdCWGc0ZFp6MzcvVDRmOE1BL3Y5?=
 =?utf-8?B?SU1meThTaTN3ZFZDZVE1Q3p2UlFIZ0FPUlVHWXdPUXFXS1lualRlM0FlZHBk?=
 =?utf-8?Q?U/jL6sCZ3JU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzFUeW5rbWpNeU5sOHcxZGxzMWk2ZXRUR2E0ZVc1UVhhWTlUcy9Od0RBOXVR?=
 =?utf-8?B?NmVERjltZWdObVJ6d3QvVzViSFRiSlpyeGU5eUlNZnFLOTJodU5tRm5XQTVl?=
 =?utf-8?B?ckZkalRXb1hOa0dETnIyeUNPdXU2Y3o4akdMcHQzcHJ1L20zY2FxZDJYM0FC?=
 =?utf-8?B?ekRYdStoM25ZdWl1cDA5Y0hxa0FDRm1Va1g0aXhqaDdXWXp0SWMydjdSYWNS?=
 =?utf-8?B?aGZRbDdDSnE5bC9pQ3pjYWg3dW9tMHRySnN6NTBEMHkwQWIxemRXUVVSdFBU?=
 =?utf-8?B?dFF0SlRpeGxFRnJHZXUvaTlpc0J0RDltMGlyQnFtcVZPSC9nczgyVi9aZ1Uz?=
 =?utf-8?B?YkdqNDNRaE1RanJQcDFHeHBOS0VHQzNQOTBCczRVWkRGRC9KM0RWVFZsYzEz?=
 =?utf-8?B?c0ZJUzhDK0dERXNpS1JtSWhhaVVSZ2RSVS9mUjYrNk9qN3NmTHpmTy93UitJ?=
 =?utf-8?B?L2JFblBwMjEzVGMrSUc0TjBJcG1GNlVZS1EvQmIvVlcyd29wZ2FzL2pxMmts?=
 =?utf-8?B?eXZUUGx1Qk1yZXJONjVVT2tKYXN3SU1mejVmTGlLQU9lYU04SlNNdlluYWRM?=
 =?utf-8?B?ZkZUTTVUK0VFWGF2WThEellYcy9ucE9TbGFvWS85ZStFcHBERStxYnJQUUVM?=
 =?utf-8?B?Q3IxQ2czejJBb0w5NmpjZXBxMVNjRy80a2JDclNHTmdMR2N5cW9FejAvZHpJ?=
 =?utf-8?B?VG5VN1pOckpoMUJ4ckptaUtuM2JhLzdOWjV0TW16dWlXc2ZhRE9CK2NqS2Vw?=
 =?utf-8?B?SXlJa0VtdzlEUThtb1pmc3I1TkF5eGdjWkUvLzJnRTBCZHpnOUJOMWkxMWlN?=
 =?utf-8?B?RkhSVnlmU2RHYk4wd1ZUSTBRbVgxb056cThNakVVLzBEOW1maS9JSHlMV08w?=
 =?utf-8?B?dTB6TE0zWUZtdklCV2UvYXQ0c1VkV3BmODhGb3VnR2J2Q3A2TnluS3pzdzF3?=
 =?utf-8?B?Vmk5ajFqbVEzbzl5SUNoeHpWOTdnVDYwcDI5ZzRMSlFQTDRqczNGTzdOY3p1?=
 =?utf-8?B?Unpod0VJOCswSWN1M1hHbnJ2Nlc5b1hYL2YvL0t3Y096aG1qTDFwL0NUMzlR?=
 =?utf-8?B?a1phREdOekk5VU5hYll3bi9JK0J1S29SdjdBVVppb2VheFJWVmtzOEZOUUpx?=
 =?utf-8?B?eEVxWkhPMXdDNFFWZ01DK0ZsWFRXRG9SMnVsWk9IcmhVSGEwdXpxZkpvbDVE?=
 =?utf-8?B?ZVUvTWxQT1NSdkJjMVExbVNna3kyK250WFEzdXV2ek92L2MwdTdVK1M4ZStQ?=
 =?utf-8?B?WW1Fb1RGeENnUEpSd2ppejVWb1pYZTFJYWNiV2FvV2h0OGY5UCtVeXM5OUY5?=
 =?utf-8?B?UUVHOU8xeDlvT0pVWkNFallIUnozS09hYXFxdmcyeDlRZmFYaXRpN3FTemZl?=
 =?utf-8?B?dmJQQWdYL0lhWTgwemI5dVVWWWRyNnJFYkFJMHRzNFN4aUxPYkpmUkJoZU5K?=
 =?utf-8?B?Tk9MVkpOZGZVMWcxZHZZOU9DclNKTnRham13cUdyT1l1OFl2T3hqVTJPNjAx?=
 =?utf-8?B?cTZETTkyNnBzcVVJbFp4NUVQRml5bFY2aWczTWZhdVIreG5sZXQrOThHYkNS?=
 =?utf-8?B?UUUyOFdNOGFkQWVBMk84cDh4ZzNkRE5EV044V2k4c3E2VVVOSE9VT3ZwYkRF?=
 =?utf-8?B?bUNHLzVzbjFVREFhSHVvK2NpT0JmSjhkTmErTlJmZm9xUDk2ZkFucnh0ekd4?=
 =?utf-8?B?VkY0SFUyU2FyWS96L2RXWGJJV1dWejN3SXhHUnBKRE12RXdOcDQ5UlVmTVYz?=
 =?utf-8?B?WXRVKzN0eVErMXNzUzNTZDNhcjhlYVdENjJ3Tkg2TDdvdm1aQldFQWxtYUZC?=
 =?utf-8?B?OGNSMG5qV1o4cGtQWTMzT2xJaWNlcDNmeEhlM0pVOStIdDFSVSs1V1dPbHNG?=
 =?utf-8?B?NTNqV3dNakYyNVN5djFueVQxWnhTL3lpRzQwTFVJZGY3UDVQa2h4OFR4Q0VJ?=
 =?utf-8?B?TTZUWXRTc0ZBMEhpZWpqYWpzNHZpQTdpM1ozbW9nSEJsR0I4ZGp2UmFkL3JV?=
 =?utf-8?B?dzRISWoyZ0ttRnhVWXhTQmU3U296WUtka2M5V2w1V2l3SVR3Vk9SQzBROUR5?=
 =?utf-8?B?cUJsQitMSmhKZW5Qei9WdFF4M1hJSVFjZ3Y3MFRhN2tESlpXNzZCQW9lOFpC?=
 =?utf-8?B?OHNmMVAzV2ZSWEYvTG5wVWVWSGJDcURTTDhIMnpkUmhuSEVLWmxaZTM0eFFD?=
 =?utf-8?B?NlE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16226cdb-0c61-4707-7456-08dd729b08d9
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 10:33:55.1656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gI7aMn3gwIqAQbyhG2Awtq8jm6eY07vLLl1wb0IJ1C8xFO1jOnbUbbAgA9AO5NahLpysq523cpeylJ0jlaY35n/5rB6mJq57D4JEenMGF/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7216

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add a RTC driver for NXP S32G2/S32G3 SoCs.

RTC tracks clock time during system suspend. It can be a wakeup source
for the S32G2/S32G3 SoC based boards.

The RTC module from S32G2/S32G3 is not battery-powered and it is not kept
alive during system reset.

Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/rtc/Kconfig    |  11 ++
 drivers/rtc/Makefile   |   1 +
 drivers/rtc/rtc-s32g.c | 385 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 397 insertions(+)
 create mode 100644 drivers/rtc/rtc-s32g.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 0bbbf778ecfa..510dc2db745d 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -2103,4 +2103,15 @@ config RTC_DRV_AMLOGIC_A4
 	  This driver can also be built as a module. If so, the module
 	  will be called "rtc-amlogic-a4".
 
+config RTC_DRV_S32G
+	tristate "RTC driver for S32G2/S32G3 SoCs"
+	depends on ARCH_S32 || COMPILE_TEST
+	depends on COMMON_CLK
+	help
+	  Say yes to enable RTC driver for platforms based on the
+	  S32G2/S32G3 SoC family.
+
+	  This RTC module can be used as a wakeup source.
+	  Please note that it is not battery-powered.
+
 endif # RTC_CLASS
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 489b4ab07068..e4b616ecd5ce 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -161,6 +161,7 @@ obj-$(CONFIG_RTC_DRV_RX8111)	+= rtc-rx8111.o
 obj-$(CONFIG_RTC_DRV_RX8581)	+= rtc-rx8581.o
 obj-$(CONFIG_RTC_DRV_RZN1)	+= rtc-rzn1.o
 obj-$(CONFIG_RTC_DRV_RENESAS_RTCA3)	+= rtc-renesas-rtca3.o
+obj-$(CONFIG_RTC_DRV_S32G)	+= rtc-s32g.o
 obj-$(CONFIG_RTC_DRV_S35390A)	+= rtc-s35390a.o
 obj-$(CONFIG_RTC_DRV_S3C)	+= rtc-s3c.o
 obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
new file mode 100644
index 000000000000..3a0818e972eb
--- /dev/null
+++ b/drivers/rtc/rtc-s32g.c
@@ -0,0 +1,385 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/iopoll.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+
+#define RTCC_OFFSET	0x4ul
+#define RTCS_OFFSET	0x8ul
+#define APIVAL_OFFSET	0x10ul
+
+/* RTCC fields */
+#define RTCC_CNTEN				BIT(31)
+#define RTCC_APIEN				BIT(15)
+#define RTCC_APIIE				BIT(14)
+#define RTCC_CLKSEL_MASK		GENMASK(13, 12)
+#define RTCC_DIV512EN			BIT(11)
+#define RTCC_DIV32EN			BIT(10)
+
+/* RTCS fields */
+#define RTCS_INV_API	BIT(17)
+#define RTCS_APIF		BIT(13)
+
+#define APIVAL_MAX_VAL		GENMASK(31, 0)
+#define RTC_SYNCH_TIMEOUT	(100 * USEC_PER_MSEC)
+
+/*
+ * S32G2 and S32G3 SoCs have RTC clock source1 reserved and
+ * should not be used.
+ */
+#define RTC_CLK_SRC1_RESERVED		BIT(1)
+
+/*
+ * S32G RTC module has a 512 value and a 32 value hardware frequency
+ * divisors (DIV512 and DIV32) which could be used to achieve higher
+ * counter ranges by lowering the RTC frequency.
+ */
+enum {
+	DIV1 = 1,
+	DIV32 = 32,
+	DIV512 = 512,
+	DIV512_32 = 16384
+};
+
+static const char *const rtc_clk_src[] = {
+	"source0",
+	"source1",
+	"source2",
+	"source3"
+};
+
+struct rtc_priv {
+	struct rtc_device *rdev;
+	void __iomem *rtc_base;
+	struct clk *ipg;
+	struct clk *clk_src;
+	const struct rtc_soc_data *rtc_data;
+	u64 rtc_hz;
+	time64_t sleep_sec;
+	int irq;
+	u32 clk_src_idx;
+};
+
+struct rtc_soc_data {
+	u32 clk_div;
+	u32 reserved_clk_mask;
+};
+
+static const struct rtc_soc_data rtc_s32g2_data = {
+	.clk_div = DIV512_32,
+	.reserved_clk_mask = RTC_CLK_SRC1_RESERVED,
+};
+
+static irqreturn_t s32g_rtc_handler(int irq, void *dev)
+{
+	struct rtc_priv *priv = platform_get_drvdata(dev);
+	u32 status;
+
+	status = readl(priv->rtc_base + RTCS_OFFSET);
+
+	if (status & RTCS_APIF) {
+		writel(0x0, priv->rtc_base + APIVAL_OFFSET);
+		writel(status | RTCS_APIF, priv->rtc_base + RTCS_OFFSET);
+	}
+
+	rtc_update_irq(priv->rdev, 1, RTC_IRQF | RTC_AF);
+
+	return IRQ_HANDLED;
+}
+
+/*
+ * The function is not really getting time from the RTC since the S32G RTC
+ * has several limitations. Thus, to setup alarm use system time.
+ */
+static int s32g_rtc_read_time(struct device *dev,
+			      struct rtc_time *tm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	time64_t sec;
+
+	if (check_add_overflow(ktime_get_real_seconds(),
+			       priv->sleep_sec, &sec))
+		return -ERANGE;
+
+	rtc_time64_to_tm(sec, tm);
+
+	return 0;
+}
+
+static int s32g_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u32 rtcc, rtcs;
+
+	rtcc = readl(priv->rtc_base + RTCC_OFFSET);
+	rtcs = readl(priv->rtc_base + RTCS_OFFSET);
+
+	alrm->enabled = rtcc & RTCC_APIIE;
+	if (alrm->enabled)
+		alrm->pending = !(rtcs & RTCS_APIF);
+
+	return 0;
+}
+
+static int s32g_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u32 rtcc;
+
+	/* RTC API functionality is used both for triggering interrupts
+	 * and as a wakeup event. Hence it should always be enabled.
+	 */
+	rtcc = readl(priv->rtc_base + RTCC_OFFSET);
+	rtcc |= RTCC_APIEN | RTCC_APIIE;
+	writel(rtcc, priv->rtc_base + RTCC_OFFSET);
+
+	return 0;
+}
+
+static int s32g_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	unsigned long long cycles;
+	long long t_offset;
+	time64_t alrm_time;
+	u32 rtcs;
+	int ret;
+
+	alrm_time = rtc_tm_to_time64(&alrm->time);
+	t_offset = alrm_time - ktime_get_real_seconds() - priv->sleep_sec;
+	if (t_offset < 0)
+		return -ERANGE;
+
+	cycles = t_offset * priv->rtc_hz;
+	if (cycles > APIVAL_MAX_VAL)
+		return -ERANGE;
+
+	/* APIVAL could have been reset from the IRQ handler.
+	 * Hence, we wait in case there is a synchronization process.
+	 */
+	ret = read_poll_timeout(readl, rtcs, !(rtcs & RTCS_INV_API),
+				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
+	if (ret)
+		return ret;
+
+	writel(cycles, priv->rtc_base + APIVAL_OFFSET);
+
+	return read_poll_timeout(readl, rtcs, !(rtcs & RTCS_INV_API),
+				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
+}
+
+/*
+ * Disable the 32-bit free running counter.
+ * This allows Clock Source and Divisors selection
+ * to be performed without causing synchronization issues.
+ */
+static void s32g_rtc_disable(struct rtc_priv *priv)
+{
+	u32 rtcc = readl(priv->rtc_base + RTCC_OFFSET);
+
+	rtcc &= ~RTCC_CNTEN;
+	writel(rtcc, priv->rtc_base + RTCC_OFFSET);
+}
+
+static void s32g_rtc_enable(struct rtc_priv *priv)
+{
+	u32 rtcc = readl(priv->rtc_base + RTCC_OFFSET);
+
+	rtcc |= RTCC_CNTEN;
+	writel(rtcc, priv->rtc_base + RTCC_OFFSET);
+}
+
+static int rtc_clk_src_setup(struct rtc_priv *priv)
+{
+	u32 rtcc;
+
+	rtcc = FIELD_PREP(RTCC_CLKSEL_MASK, priv->clk_src_idx);
+
+	switch (priv->rtc_data->clk_div) {
+	case DIV512_32:
+		rtcc |= RTCC_DIV512EN;
+		rtcc |= RTCC_DIV32EN;
+		break;
+	case DIV512:
+		rtcc |= RTCC_DIV512EN;
+		break;
+	case DIV32:
+		rtcc |= RTCC_DIV32EN;
+		break;
+	case DIV1:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	rtcc |= RTCC_APIEN | RTCC_APIIE;
+	/*
+	 * Make sure the CNTEN is 0 before we configure
+	 * the clock source and dividers.
+	 */
+	s32g_rtc_disable(priv);
+	writel(rtcc, priv->rtc_base + RTCC_OFFSET);
+	s32g_rtc_enable(priv);
+
+	return 0;
+}
+
+static const struct rtc_class_ops rtc_ops = {
+	.read_time = s32g_rtc_read_time,
+	.read_alarm = s32g_rtc_read_alarm,
+	.set_alarm = s32g_rtc_set_alarm,
+	.alarm_irq_enable = s32g_rtc_alarm_irq_enable,
+};
+
+static int rtc_clk_dts_setup(struct rtc_priv *priv,
+			     struct device *dev)
+{
+	u32 i;
+
+	priv->ipg = devm_clk_get_enabled(dev, "ipg");
+	if (IS_ERR(priv->ipg))
+		return dev_err_probe(dev, PTR_ERR(priv->ipg),
+				"Failed to get 'ipg' clock\n");
+
+	for (i = 0; i < ARRAY_SIZE(rtc_clk_src); i++) {
+		if (priv->rtc_data->reserved_clk_mask & BIT(i))
+			return -EOPNOTSUPP;
+
+		priv->clk_src = devm_clk_get_enabled(dev, rtc_clk_src[i]);
+		if (!IS_ERR(priv->clk_src)) {
+			priv->clk_src_idx = i;
+			break;
+		}
+	}
+
+	if (IS_ERR(priv->clk_src))
+		return dev_err_probe(dev, PTR_ERR(priv->clk_src),
+				"Failed to get rtc module clock source\n");
+
+	return 0;
+}
+
+static int s32g_rtc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rtc_priv *priv;
+	unsigned long rtc_hz;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->rtc_data = of_device_get_match_data(dev);
+	if (!priv->rtc_data)
+		return -ENODEV;
+
+	priv->rtc_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->rtc_base))
+		return PTR_ERR(priv->rtc_base);
+
+	device_init_wakeup(dev, true);
+
+	ret = rtc_clk_dts_setup(priv, dev);
+	if (ret)
+		return ret;
+
+	priv->rdev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(priv->rdev))
+		return PTR_ERR(priv->rdev);
+
+	ret = rtc_clk_src_setup(priv);
+	if (ret)
+		return ret;
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0) {
+		ret = priv->irq;
+		goto disable_rtc;
+	}
+
+	rtc_hz = clk_get_rate(priv->clk_src);
+	if (!rtc_hz) {
+		dev_err(dev, "Failed to get RTC frequency\n");
+		ret = -EINVAL;
+		goto disable_rtc;
+	}
+
+	priv->rtc_hz = DIV_ROUND_UP(rtc_hz, priv->rtc_data->clk_div);
+
+	platform_set_drvdata(pdev, priv);
+	priv->rdev->ops = &rtc_ops;
+
+	ret = devm_request_irq(dev, priv->irq,
+			       s32g_rtc_handler, 0, dev_name(dev), pdev);
+	if (ret) {
+		dev_err(dev, "Request interrupt %d failed, error: %d\n",
+			priv->irq, ret);
+		goto disable_rtc;
+	}
+
+	ret = devm_rtc_register_device(priv->rdev);
+	if (ret)
+		goto disable_rtc;
+
+	return 0;
+
+disable_rtc:
+	s32g_rtc_disable(priv);
+	return ret;
+}
+
+static int s32g_rtc_suspend(struct device *dev)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u32 apival = readl(priv->rtc_base + APIVAL_OFFSET);
+
+	if (check_add_overflow(priv->sleep_sec, div64_u64(apival, priv->rtc_hz),
+			       &priv->sleep_sec)) {
+		dev_warn(dev, "Overflow on sleep cycles occurred. Resetting to 0.\n");
+		priv->sleep_sec = 0;
+	}
+
+	return 0;
+}
+
+static int s32g_rtc_resume(struct device *dev)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+
+	/* The transition from resume to run is a reset event.
+	 * This leads to the RTC registers being reset after resume from
+	 * suspend. It is uncommon, but this behaviour has been observed
+	 * on S32G RTC after issuing a Suspend to RAM operation.
+	 * Thus, reconfigure RTC registers on the resume path.
+	 */
+	return rtc_clk_src_setup(priv);
+}
+
+static const struct of_device_id rtc_dt_ids[] = {
+	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data },
+	{ /* sentinel */ },
+};
+
+static DEFINE_SIMPLE_DEV_PM_OPS(s32g_rtc_pm_ops,
+			 s32g_rtc_suspend, s32g_rtc_resume);
+
+static struct platform_driver s32g_rtc_driver = {
+	.driver = {
+		.name = "s32g-rtc",
+		.pm = pm_sleep_ptr(&s32g_rtc_pm_ops),
+		.of_match_table = rtc_dt_ids,
+	},
+	.probe = s32g_rtc_probe,
+};
+module_platform_driver(s32g_rtc_driver);
+
+MODULE_AUTHOR("NXP");
+MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
+MODULE_LICENSE("GPL");
-- 
2.45.2


