Return-Path: <linux-rtc+bounces-1927-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D5C974ACD
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 09:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 497C41C210A9
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 07:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5280E558B7;
	Wed, 11 Sep 2024 07:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="taAIlm+w"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2060.outbound.protection.outlook.com [40.107.105.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8D2A936;
	Wed, 11 Sep 2024 07:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726038042; cv=fail; b=BIQ/gEfqUaJYwcKoAQJBvmq2VdqeQxqxxR6KdvQ2BPgrLo3SYvuccm2LBzQWWUiwy6ulLxnWmsKXg32ABHq6nMBiQ8ZlhCQ9uUgpvPw+bYHj0C85bN1QdDmOtG2Q8yHJiuAXzsMNQr4dEDXK7FqDpTCfqPvSH6MqEe/JMV6ktSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726038042; c=relaxed/simple;
	bh=omKAYP89xMhnhW52X8VxLHtT7ZgyZ9nOAQqeoo/X8sQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=WOsPHAtC9zgt1/LyrkfJXr6WkK5NSMNvco39tUdPp/j8s2ZGe0QqsAetMINnTch87w2W8A1YegqfY45nCfNI3SF1SrJspsoYeBlfMGAqyqwiZPqDj7WvDtGruUzg0TRL9m7pkhk3HRihn7nTx2JCf3U71EuRh6BPJnx9foOvgGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=taAIlm+w; arc=fail smtp.client-ip=40.107.105.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndGzWYgU9lCf/pHt/TNq1/4sLuxzgC1x9zyx9LpXmTqL2COdFeT5hOk+per0KxGIzeg8mwhYnRj5aO/QOuqG1Vc3rRzj70UwAJRSi+B/2vyL3QbzA8W6KXUT3v2c3b6FZGsJloOxwn246031bA3kFlRCvfkLBslUFKzgq4bnbucSgrrlc0JJwHKvhEoOPtQWI4cxJt/JZww35hkuFw94CgLH4RxhSuU4PAxYl/olqiac9xjKUUTkYPKmdRtHQo8aPtIi1faGsHzO7b6iPf45iV2Q+lIlKQ2ead4qrRdpmlDm9qfrA2wLGZC/gc2D/XxROpHXbQL+o/XN54On8wM02w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pk88qSp/nHT/zatXuB10xJuqOhNhCb/34wcUjPslB0Q=;
 b=Unlatcds5T7QVcf5XfIUIs47hUTBnYRvWcyfeSKhJzEJ9F5Fo7uk3BrmZy6CUqiK+4WRSWxvsnXpa9b/IGubG/2x8lxRVX01MN1HachVFasu3yXdZ7L4RpoaO87+uoH9A6CE+UgYP69gBkpgSAduxAeivvalZ/i7avzXMGEqLXieR3ho0hMxrgxWwECvyDnSlh9t+FWApnX2NQblj4EMxswy3OmtCbVfK+1c1pJ7R22MXiNSEhsXgDpuEwJuzRvqWH14XXHqq+BkpY51RP0SFGilNt1GN1bD413VuYZXA0SILq5Vh4atmBZFfdljhGlsvUbUdhv+BaF/QXTAQZHycA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pk88qSp/nHT/zatXuB10xJuqOhNhCb/34wcUjPslB0Q=;
 b=taAIlm+wf1anq6B244cWipImKKSrBCj+yJB/+RL3yQT5Uq6YrozwBlQ9BHVIt0ZgJTb59d1GLoCQkChsrnL6eC0Waiy6431qHRviyXGwfgjzVnXJTTU73qxE765L3YcY7GNj4fhKNywn5RbU3rFYzpX8bIdpCz4p+GZWmYPbdOsuoLZy5sAFwppVnRgriDell+I5V84ajbvh4BQLt9m9peeGLlVSrz/cxZYqR5C+3cfaW2JgGem9atTZkNKf8Q/UJPJBJO3Rdb2AA/9sZJ5C63N5lWZd84dbPaS1mQnwTWkGd61NRBgXGEyO/yIlj0H9nBhIYZEsXvkf3JmeVY8gcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AS4PR04MB9507.eurprd04.prod.outlook.com (2603:10a6:20b:4ca::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 07:00:35 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%7]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 07:00:33 +0000
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
	NXP S32 Linux Team <s32@nxp.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH 0/4] add NXP RTC driver support for S32G2/S32G3 SoCs
Date: Wed, 11 Sep 2024 10:00:24 +0300
Message-ID: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0117.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::14) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AS4PR04MB9507:EE_
X-MS-Office365-Filtering-Correlation-Id: fb21a6d3-4965-4cc2-b38c-08dcd22f6de4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2dsRjZCMnVLbXA2L1EyeGFhWWdXUWl6RTJMMkJsZ1ZTZ29VektvVW5mVi9I?=
 =?utf-8?B?RFRod2JjSCtaSk85TlNadnBFeXhUTHNVNGN3OEFVd3U4K1ZXa2ZRajZHZDdE?=
 =?utf-8?B?QnZ6alh6SEptODBTQ2tyVTQ2MlI2ZnpGSDNCK1JCVGZNUjFrMkJnMllPOVRG?=
 =?utf-8?B?UkVFNWZoZlJBSEltNEw2L3QwTWUvVWg2THh3L3FMdmpoSWdhZ3BoM3NnZTRo?=
 =?utf-8?B?L1FDT1RkOU9LZHhUb1VSMUJ6OFV4QUZzNTFzTzNJekdtaktIUFF4L1FOTCtv?=
 =?utf-8?B?cWgrUUhzQVBTVDROZ3hjTFRwLzVkcml1VW84UnlmZlhSR1dILzVQSzF1MnR1?=
 =?utf-8?B?M2ZOVzJkVWE1OGxlTEtnOFkwdmxvMzEzbGY1YVBOS2xFMnl3TmNsNjBxUktp?=
 =?utf-8?B?NE9yVGk3VXJUN1h1UVR2V0xnaTBqUXVsTXdZT0N3MTRXNEdNZ1c3Q0thek81?=
 =?utf-8?B?QThFdFpMYm5CYzBtNkNRVjFMd1ZLTjhWK25WZzZhbzNCQkZsbWxPVTFSN2hY?=
 =?utf-8?B?cVZhRmJYZytGeDZLOGtZK1AxNjdqMlFjT0hILytsT1BqMDN2UldMVTNWV1Np?=
 =?utf-8?B?OTA4M0RxZHZjNm4xbnloZytad1N2dmU5VExjT01ob3hTTm92USt6dDBUQ3dY?=
 =?utf-8?B?RXU0QWFEc2c5RkV4TDhiNzVselpncmwzVU9WdnQ5cjhmSWNmWEE3d2JMdWd3?=
 =?utf-8?B?Qjc5TUtkOXNvSCtCMndQK05hZnRjQlRMZEkwYU5XZysxVS80YkdOVHlxQWtH?=
 =?utf-8?B?a3VLYVU2MzJqNlRMTUxBNUJMYTBOandZVW5Ud0tyYkY0dDJmS0RYT0wwZjRw?=
 =?utf-8?B?cmcxTzFiZFNDcFd4Uk5DRzVrNzFSS2tiZ1NYR2JJNDB6Q2ZUTWJWdkw4NVpi?=
 =?utf-8?B?bkU3Q3o5N0JJS3JidHZvWE1ob3l3ZW1UbmNlRUtGaWkvVDM5dG9GS2E3SHY3?=
 =?utf-8?B?d0YyTml1aUFwY3k0c3psV3NiaDJ6SkJCRjJyR2J5QUV0dWx1YTRUR0hzWVI4?=
 =?utf-8?B?emlKUmNodWhBTSs4TnBQYTFLdlJBQ0ZMa3pjaXp6c3laRDRhZURtamZWWlZS?=
 =?utf-8?B?enlrdjllNDNZVWRsZG1Xa2hjVHNTSVVlWThCLzdoOG4zdnBuSUNzL1dneHQx?=
 =?utf-8?B?czNoN1dTK1l1RWdEcC9FMHFpaHd3bFhGMnQ2dVdkZGpDY2RMbldtLysvMW4r?=
 =?utf-8?B?WVdSVThZQzkvZkI3Q1NqWUlvbzFZTEU0emVJenphZllZNmxjNVg4OTBYRXdQ?=
 =?utf-8?B?YytFNStJaERXY3B5bGNHK1VZNktMWllHV0VqbTBPQStIQlFxOGcrYVROa1Zy?=
 =?utf-8?B?VW1xMG5YNWxLMEwvdzBuREdZUGpXK0t3ZXNqZXpnNENaNjNpZ0hlMllpS1Yw?=
 =?utf-8?B?VmFxL3VnYUYvK09TQXRXRG4zZkdaaFd3V1RvbjBHOHZ0TkpTRS92RnJJODd6?=
 =?utf-8?B?V2R6bVFrcjdGY3c4SEVQZW56OU5SSWtjQ3Y3RzBTNHdnUVF1ajdiRFRHZVhl?=
 =?utf-8?B?MkVSV21obDhYRis3ckh0Ky9zZ1NMa3JXVS9kTnhleGRvY2tuTU9yM3VsSStm?=
 =?utf-8?B?ZnNVYVIvaWhramNjM1k3aENTeUJ6MEp4MmxRbUZSYVZKc0s0RjBNM0ZCdlBB?=
 =?utf-8?B?OEFjNXA0V3Vqd1IxakRCa1VFOTJEMWtCcEdXZkYrVi94bjBVN0swa0RoMTVF?=
 =?utf-8?B?S01SaHBybXdWMG00bk9UMVliZUllOExpWnFIdnU5bGZqL1lqVEJyd3Q4d2Nn?=
 =?utf-8?B?bm9NY2RQYjlGdDBDZFZUcnJldEJmejN4KzRtbUxZZDMxMWVQOUxnZmdyVDZF?=
 =?utf-8?B?REtMdVFnbjRZSHI1aVljUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azNVMjVaNWVWY3NnbUw3MWRHdzNDRW43bEZWS21QdTc1MlluN3NMYlJVNTVH?=
 =?utf-8?B?b3ZIN0tuU3ZKcmN1UVZOdU01enJHU1g1M0Vmc1BxUEZYZXFBVEJPWTV5bVFS?=
 =?utf-8?B?dlBqZGtFUWJ2YXpYYTdvN012M2QvYjNZTS8vYXdxREVYK004VXZlZHkrZ01U?=
 =?utf-8?B?cmowYzlLVWFaYkpyb0F1cFRKbVQ3MTdGZ0s4TXRhZWw2RUNHc21BUzJTM2xs?=
 =?utf-8?B?eHRzVk5Mck52REt6ZVlvTElCT09Rak1SYmdIemdScmtMdWJDVEx6MGpuY2dU?=
 =?utf-8?B?TnFVSUFncExIWWo0NExYSFlHZThFUmF6ZE5qVlkzdWgyS0ZsMFV3R1hXRDNF?=
 =?utf-8?B?OXloVFVHa2MwbXVoMThyZ2trRi80ekZDUmtOb2NzY3R1eGYrOFpKNTQzUTRq?=
 =?utf-8?B?RTcwYzNKZ2F0UWNRRUsyL2c2R0FFak5odXJ5THk5cWt2ejNIdHJrMWRqS2p6?=
 =?utf-8?B?VTNRaGZFa1lJSmN0UUVhUFVKSm5lM0FMZ29nVys2M01iR3RUMnRIVmNKdWtu?=
 =?utf-8?B?enZSSDlZTXJrYUdkcER2bUt0UUZHSnpRZzIyeDN6NXNzU2dqUEU5R0FDb29s?=
 =?utf-8?B?aHBWYWxEcjFzNTMwd2sranVRbkgxMlBENUtZdzZvREQzYzhCZWdzdDZxQm9N?=
 =?utf-8?B?Y0s2OWU2Qy9KekRTdWUzUTYvenQxMlptNEExcUNleG41RFAzaEhuM2dXbk9S?=
 =?utf-8?B?WitSQ3lKbGJmOGw4RUlrdmhiUjZ4YzdzZTJYTVF0K3h2Y2ZXWjc0ME9TbFd4?=
 =?utf-8?B?dlR0NzJZSUtIWDBjUWFZSDRBcncvT0Zsc2RuWi9yTFY1bkxHMFVuRTFpRWJV?=
 =?utf-8?B?Nk5Eby9zMzd5MmFrbkNQUFJ6U2hwdDZaYTRwT3VOei9mNHZsa3N1WGFheTI1?=
 =?utf-8?B?czQzWEdRSEJBTVVXTS9GV1ZaMlBIcWpqRVFDcmtyRXVEc0N3Yk1CSEVDZ2hL?=
 =?utf-8?B?RWRQU3VMUkgwYWdWU3lHQm4yeUxTbDNqa2pWcWFoQ3g4Ny9vbU4wNGFNMURN?=
 =?utf-8?B?ZW9jY29jN0NSOTJ5YnFqVHJWaUU0WFBSazdOaTZZTGNCbFVlU0w5b1JPakpH?=
 =?utf-8?B?VUZDdkN6d1BKMVhZZDZ0aHVUV2tqUEtYRmhITW1FdlBLVHhTZm1sTTlFdmR5?=
 =?utf-8?B?Wm94VXBHOTFyemFmK3R2a1YzdDBTNlhGbS9TUExrUjhQZ01CQ1lneGJtUExl?=
 =?utf-8?B?M2lzQ1FDSWl4eTlQMk94enRpU0tQN1JKSS9RRFN4Qy9EVUhneGovZ0ZFblFR?=
 =?utf-8?B?dmZNSUV3Mjg2eE41TFZKdHlFNEhOV0ZqNTNUTkhsWjNDREI5MHg1S09PMGNV?=
 =?utf-8?B?RnliNUM3M2wxYk5RRElFM1NTUWpHUmx1d3U3Smw1MzFmeDlRMEcwSFpTN0hQ?=
 =?utf-8?B?NE83dEZQQzFKdWVYKzJkUjMxNjA1Y2lrOThIeitzcTd3NWhGZGk2dnZBUUtS?=
 =?utf-8?B?eEVmMFYvV2RaNDRYM2swZlU3RFpZYk85UExmVHpjcFdHUzRJcFNzc0VDTDk5?=
 =?utf-8?B?Q2luaDdkVEpwb3FibTNFdmhPQkRhb2YzNVJOb1RudTF5dTBHNEJNTngvWFhE?=
 =?utf-8?B?RXBXU0RGTjFDb0wwek1WNERyWXZJMnRGaVZQZGJJQmduUnFkODBJYjJndXpQ?=
 =?utf-8?B?b3JNV0RqYjVVU1NUWlgyRFJDNFd6WFVLWVIxUjFoZUM0ZFpGb1dqMjJUNncr?=
 =?utf-8?B?OE5uU3NheW55Yis0SXpVNllSNjRndFpPR2d2R2pHdTdYYTZjdXcxYnY0dkFk?=
 =?utf-8?B?b0hvV0locDJGSjc4bUdmNStrVmtDZ1hmSm1Kd0VMNTRDWmpySzJWdStEY1Bq?=
 =?utf-8?B?TEY1YUg4WFhkSksrUGRNb2dkbFhGRUhyUXl3WmRsYnR6alZZbDhWQ3FhMmdQ?=
 =?utf-8?B?V0g3TCtoYVVuTXR5d0hyRnRNV250SDJ2K0xIbjRyZ1UyeEhjZHk0SDYzUzJG?=
 =?utf-8?B?ZjU4SitsNzRwZ3Qvd2RuTkVlVm8vNTdMbVJLK3JFTWFhVWFMejMyeVRjeS81?=
 =?utf-8?B?Tktad1BkL0gzSmxzR1NpUEl6L21wZjFmTVhucjg0MjhUcmZXMGFleTFicGRN?=
 =?utf-8?B?VHlOODRjR3JmNlpwclhzdE5YR09haWlYNVhmblREOWZjQnlZeHU3Zkx5aHNr?=
 =?utf-8?B?eS9zOXhJYm5nUHA2YWEvT0svRnVIODFlRzRXMmlSMVRicXczbCs5OU8yTjdO?=
 =?utf-8?B?VlE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb21a6d3-4965-4cc2-b38c-08dcd22f6de4
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 07:00:33.6608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WyhdxOqUkzNglQaXJVtclKX8v2cqmH3kvMgD4CJYFKniCBVw5GEKb0vhUd/ReFaC+Nd7+bxcqqIQ437XMLj3boXxZ53/P6RUodefaxbGEAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9507

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

This patch series add support for the NXP
RTC hardware module present on S32G2/S32G3 SoCs.

The RTC module is used to enable Suspend to RAM (STR) support.
RTC tracks clock time during system suspend.

Following is an example of Suspend to RAM trigger on
S32G2/S32G3 SoCs, using userspace tools such as rtcwake:
# rtcwake -s 2 -m mem
# rtcwake: assuming RTC uses UTC ...
# rtcwake: wakeup from "mem" using /dev/rtc0 at Wed Feb  6 06:28:36 2036
#

Ciprian Marian Costea (4):
  dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
  rtc: s32g: add NXP S32G2/S32G3 SoC support
  arm64: defconfig: add S32G RTC module support
  MAINTAINERS: add MAINTAINER for S32G2/S32G3 RTC driver

 .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml |  79 ++
 MAINTAINERS                                   |   2 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-s32g.c                        | 689 ++++++++++++++++++
 6 files changed, 782 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
 create mode 100644 drivers/rtc/rtc-s32g.c

-- 
2.45.2


