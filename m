Return-Path: <linux-rtc+bounces-2198-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5721999E48E
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Oct 2024 12:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 091CC283EC7
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Oct 2024 10:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7DF81E7C1F;
	Tue, 15 Oct 2024 10:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SjFaqYAm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2076.outbound.protection.outlook.com [40.107.249.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EBC1E6321;
	Tue, 15 Oct 2024 10:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728989506; cv=fail; b=FwU3LJ4GqLk0pmCkvox3f6Z+xxYr1lzW9Ka6Mjye2JEdKE00XSFY/zdE7/6kx62fo9bzoyEA7kcOPU6uFQwt5gNCHyeSjOWR8NPIJvaoW8CFgkqqaOu6SBs1xRfsbJ+ueQJc7hu+8SnONOiuQakxQtJc7Rwi1HvO0evcsHjd8vw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728989506; c=relaxed/simple;
	bh=0voeKvE9rXRu9NUzy2sK/HoTJf/UXhjiZ8VE5AHjFos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sMBvHmvMBA+F4toi3RyxFhuGYhtmkKi4/EHafn0uFMD4GXKDNiVgSXrtoCJKF5J5bBxXxjw0qfZU1IP2JNLB/r+/mOlLRSn4s9sWgEMoh6VcP9SufDyf3l4o5Y7ZvCiFmk1SHplgTZeGfS/dj+IW+x1cpgBA7SJVLq2x6Y6/864=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SjFaqYAm; arc=fail smtp.client-ip=40.107.249.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgV6K5inuYFo3p8nmAX+paSjGaw4c+Ommwaeoq6arFrqJU3Xk48Xv1wmU/kKdYXrZyjv4KK4WbDSZ2aqUAkmxj3ZyRGef5nSCAGiTwlix4SWS6Vn25VOHMfqOC3OrEm0lYNzPwS+xBlg3T6vtIhZTgEp0LyCySgnCZyE6bHcAe5COsg4WcdhW/HElM9SHKnvPyI/Fs+prLDwdLFRF9sUXPYwToFwUOMehUGHdUEOSbgH9htKssrUOfnKVgoZSVvwaKZm6pWNvhWZbM+Z45RpCmBm1q34paBSNROghmz4qh/uivq4gCEsUGZGgGg+wQsid+XxzBFPonaHxxgnDVOKwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2ZoT/o0BbX+Csgj+qBZ2+0Lpbgr8GJxoJnuxScG7do=;
 b=lG7/x8/tDGsXvoaGHvjYe+irCLInLiYD3g66ayvg6glRDy8W80HeC3GafFi+HZn8pzdDUg4v8HegvkTTwap0tfrJEEjYeuGxTvPEmNSvVh51LVY6w6bcBR8ajkka+2wcdQdMxfPiUyCK5ELOGTigZh2o7dPgZkg/bWpd9v8c0q4QuJR76uhXwg8tqdcCHh1T78J2g6whSh2aUWyjxs+LXJ+9PjSBBJq6ga2/DiY2dqGKX0ziyCmhFKn6rkSepkfUdVodXU+ULgsvgiCiB0E8Xa92sAMArQ6ggo3yW9ibgbpIDLhiX/PdAfiULfz2Db60XP8wMwC8w9nvZliYLvC4LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2ZoT/o0BbX+Csgj+qBZ2+0Lpbgr8GJxoJnuxScG7do=;
 b=SjFaqYAmi2nVTfDS/wq/s0+ntQEnAzCxZd4V8ZYME3KTAyk5/KOwVfNASifHzeGWST6C7bMf9ToqAjX5mBB9DCnJXAxU2BTYtcRlgqMkNu2o8UTqDd6PaGJBB74WqbEnLQxRJbEBR/oIPvIOcuI6M8c+3X4lDwhZLW5OiqbcimSuuvV9fjpNHP++H7Ns5qvmoxPLMis9A1nnVoeVVZlg45P7pBDBcOhMX05EZArCjoYZZv35c1p0+QH76Tk+JrcHALUBAelrQ6BOtDYc3v+bTzgn87f3nDowkZDFHYPCnhxGNLsrKapDlUoYY0gDSGUcLmV/ZGcT4jCX03KTlOL9Rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AS1PR04MB9238.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 10:51:40 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 10:51:40 +0000
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
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH v2 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
Date: Tue, 15 Oct 2024 13:51:30 +0300
Message-ID: <20241015105133.656360-2-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241015105133.656360-1-ciprianmarian.costea@oss.nxp.com>
References: <20241015105133.656360-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P193CA0026.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::31) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AS1PR04MB9238:EE_
X-MS-Office365-Filtering-Correlation-Id: e654446d-3b98-4f33-c837-08dced075961
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXB4K0JBRWs5RkxINEphQTdWK08yTEVUZzljalRQdzVCbk1iQktUa0gzaGV6?=
 =?utf-8?B?TFA3ZjZNSXVKcFNsWURGMnBlaEt1c0JuMS8zSS9GeDBxbkxycDFObjFvZW9n?=
 =?utf-8?B?RkNCVHJFU05GMVdnNzdqMHlpQlRsNVFjS21QYmFLRUZCU0RtSEQ4N3JjeUUz?=
 =?utf-8?B?dzI2MkFTV0twZ3F0aUFOb2N3WnNIRGFEQ240QWlkR01vdTNDZi9vUVR4YmVr?=
 =?utf-8?B?SFVwaHdLNytUWkkvbmVEbVUvMmVwNjBsVC9hVE5pcGYyWlNuRDlSWFZlT01R?=
 =?utf-8?B?OUpRUm9tN3FoRkx4WDRYQm1KUVY4Z00vMkpiaTZtQ2dxdWR3Z3BUWnhrY2RY?=
 =?utf-8?B?aFgxcG96VzFjRUozQmVUZjZKQzBYSjJhc2E2ZVJ3NDRBMEN2SmxtdUdQam5l?=
 =?utf-8?B?OFNxaHdYOGpkK3RJeFNmNk1VaFpLa3d0OXVSTXhjUkJrWnBLS21FTWJMaVRP?=
 =?utf-8?B?QWFENG9GcUF0Y1VheU1zUVF2NjdvRjNoblpwMEFSNnZVUWJ3SFYzMk00blQ4?=
 =?utf-8?B?MVl1RHowbDdyVmh6emxFTHl1dDEvWjZHVjNUV0pvU1VIdlhpMW45UkcyYTVl?=
 =?utf-8?B?OEhTQ2pXWXlBM24zZmRMenR2QVg2RU9pZURyN1JoL2VmdWMyb0llKzc1c1lJ?=
 =?utf-8?B?UjFDUVpaT1JuaG9XVnNVb053YUZzVEJrUTI5YXJSSFJ4azdrUEcreDV1dm5Z?=
 =?utf-8?B?d0pUSjZaN0JOLzRtdnMwUEtxR2poamhIcUdwcko1bUR5akFyWFkvVGh3TlVI?=
 =?utf-8?B?dS8wMFpHeDJxQmtLbzMvSVFiLytaZFd3cWZISDNzSm1GMTk0S1BzaURaZlZ3?=
 =?utf-8?B?SUJMRTA3WG9Bb0MzTWlRS2FWRnBhVUFobjlsa0xkUEdOV3FhVTByTmRYVWJ5?=
 =?utf-8?B?UDdGREdMaC95Q2l2Mmthb21tbXoyckVvSXdmMFNMU0IrbFMvK1liWGdnRlFE?=
 =?utf-8?B?ZDJOUnNJN2pwYm9venlna3VmNlZkQUZXRkQvUWQ5VUNqdWpnRE0vQllwUSs5?=
 =?utf-8?B?N0h4em5ZRW5Fc0hjeSttN0JQVTF2RzN6YmdDVVpCUml1SUJtQW5XSUdUbzUr?=
 =?utf-8?B?SENsMFY1UTVOeXNtMWlqKzBSc1E0Snp2RHVJTUZodmJlS2E2VkxtNUlGaVZv?=
 =?utf-8?B?RUJxdFVkWjVsVS92eXBaOVMxZFhGTnFtRHZJclU2YmRvUFhzKy8wUms5T0tH?=
 =?utf-8?B?NGtIK0k3SFBzK3ZxaHExNWNNc1A2cEdaL3BXczlCdUhaSG12cDlBalovZjVV?=
 =?utf-8?B?M0tSTm5abWlZb2RaQXdlSjNkMnQwdGIzYzhqMXF2OEEwYzg0Um02T3lCSkFy?=
 =?utf-8?B?cVFXb1BmZWdEWW8zcERtNzlJQUlyMTNyVWtNc1cyaFhRQUlVR0hZRTdNOFo2?=
 =?utf-8?B?dEN5OTl5UmNMcVdKY1dpVXhRcUVUaDJFR0lzL21YMGhnYVhlcXozaUxaZkVu?=
 =?utf-8?B?N3FicEUzUEhiVkZJcmFzcDhBYkFNSW1pTXZXeElSOEhnaU5KYm1FNEtQSy84?=
 =?utf-8?B?VXkzN3d2MUtxZVlIeTJGd2s4dHVLRmZiTVk1Z1VhSi9uU3VVZENQSGUyRndx?=
 =?utf-8?B?em1nY1BsaFFYdUZyNHZOR2lwdWdPd0pJdUtRRElobUxxc2tkT1BzWGJPYm4y?=
 =?utf-8?Q?Hy+RqQH0u8ivePXVbf1Q2Beij6dYuPbIBYBAyn9tWbMc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Si8zOC9ITTZRMElFeGc1a2gweFU1YVdkNVdkU1QzcVJvMkpUVFZ4RlY0OWox?=
 =?utf-8?B?M2hrdE5JSHJlNmtLUEN4Y0R4bU9tVHBYWGpzYVl2WCt6SXoyc1JCZHF3bkdP?=
 =?utf-8?B?QlVDN3dyNDlqYUdPRjFoeDlmcDc3NGZSZ01ONUx4SzFEUzR1bitrRzAxTmZh?=
 =?utf-8?B?TnM1L09zaFdNYlQvN0xCVnV0S2E0TXl0YTB4WCtJUHpxSHREekVzQkpBU25x?=
 =?utf-8?B?b0hpakhCSnJRZlpIL3ZzcWlSaUtiRTZzUk9pNUUxRWd3M2ZxaTF4OThQWE9W?=
 =?utf-8?B?MDRHaFhyVjhGcWpkZFJmdnN1NlkzTER6VG84V1FQVVpkTVVwL3JJcWNCeVk0?=
 =?utf-8?B?cTA3Zm9lcHczYXRRZy9RL0NXS2hxYVViWnF1S3lNdEd3V2xEZEV4Rm1qbDRp?=
 =?utf-8?B?bDlDeDVJamtQaENiUzg1OXFtZHFSalhuZmF6a2h1YnN3NGFBWHZ3N1pET3p1?=
 =?utf-8?B?ellCYjlBMmlFM1JubndlbmV6Wmg0QWlOSjA3cFhWRGx5M1h0dkQ1V1Vyd3VC?=
 =?utf-8?B?K3Rxc2JmUEVGWnkwQUljSWFmdjg0cnBXa1lhNmJIT0d3U3dGa01HU013czBQ?=
 =?utf-8?B?ZHhrVnJDVzJ0MGRBdDNibGI4Rm4zbFlDbVpoWEVoQUhNNU8zYVdBMEZzVUdY?=
 =?utf-8?B?UWVXaHdwaEpLWFIxNXA2Z0REb2tJM255LzlLaGMrTWU3c3N2cWFsbWZuejg0?=
 =?utf-8?B?c3NmODROd2MvR2Z4Sk5qVkVuVUhndkk1YXhJdlI2WS9MN055WnFodkIxYTZq?=
 =?utf-8?B?SHpEQmpLNGUvcnJZd016RHRaMVUyTXZsVXhDSHNvazc3MnlEL3k4MUNlcWtG?=
 =?utf-8?B?QjF4Y3BJTy8veWM4LzhqUEl2QXhMSDlEdDRnRFRLV1Mwcm01T0xxWHVhakYw?=
 =?utf-8?B?TllxbCtBdWdxQ3pQQm5KUW50MERScnVWVCs1SVZEQ2VnUFhxcG5OQUw0MGho?=
 =?utf-8?B?cG1WYk1mdTV4WGtpcmxFMWxnT2g5aWMrZHFkdTBURy9vVGdERWYxWkRYUjNP?=
 =?utf-8?B?Zi9wZjh4UDdMMHduSjBVSERYVVFHUDVQK2d4TEw2bGFnNTNwYng5TU5teVVS?=
 =?utf-8?B?VndmNko0MHJQSDFuTFNpakUyYUhKTEE4MEV5TUNhNHZTeUR1ZG9uSGJ1UTRT?=
 =?utf-8?B?cXp4bnpKb2VreDJxd0tBQnFZWUhJT2dUZDhBYSt5alhzSFBWMDJ3aFRsbXkz?=
 =?utf-8?B?S2huK0JOQXhNNjVMcVlOV2xkWHZ2clJjT1ZKMENjYW5xdVNydVVvYStTUXhU?=
 =?utf-8?B?dHJrQ3M5NjBxWUs4eU9iTDNXM0pISm82ZTg4bkc2RHU2T2wwYlNwVjM4eDhi?=
 =?utf-8?B?LzR3bUowNVlVU1JyNmVBZVorNW12U2luVjBsa3NTUExwM1YvR0VpRDRnSW8x?=
 =?utf-8?B?R21IL0JTZ1AwVVVFekphSnRYQm5XS3VuWEcwMi8vYXNlVThXUlE5NWZkL2Rv?=
 =?utf-8?B?RDQ5OWFGVWVwbFRwVVVrVkhvdmUxUTJJc0docDlTUTRNMld6RmJXaUdxbE1y?=
 =?utf-8?B?SFBXM1ArdzN6N2hYcUVMSVdkTGErSzlYVURZQ0hoenQ2UkdXRVFzK2JJT2My?=
 =?utf-8?B?OHdrZjJQTEQzWkFTaGp6aUVGb2Q5WDdNamtXa0V1c3dHYjVDVmN6S21mZTMz?=
 =?utf-8?B?MFl5d3lKNVZKMXNDRWpzVkVxa1hFVUtpNzJHRGtyUW9xeE1RdndGaWNaUjhF?=
 =?utf-8?B?aHFmWG5oSmtOYUxxcFVVQmNydWRhclg0WmptRmN6N09sR0dUR2gzaEY3azVt?=
 =?utf-8?B?aEhaSnlRUXBQb25BODZGL1U5c3ZYaWhyaWllSHFBQTlsZjR6UzA3MXkwZFo4?=
 =?utf-8?B?WHg2V0RCYzlJUldFSGF2clA4K3VrbmJkZmlpemVHYkVHNFhSc21VSFdMb1dr?=
 =?utf-8?B?TjkzbDd3MjZqMHkyTkloQzM5NENRM2NBZ1pkU3QrTnUrUFVQNThNZU8zQndU?=
 =?utf-8?B?QmR6MEtkK2JjL0kyUGlhREIydmd2VTcwcjlESXhZYVBSN2I5Lzh6T3luR3gw?=
 =?utf-8?B?ZUZIcGVCOG0wTEhUY2xKREtIMCt4V0MyWnhHYThpaHdERSsxbE5Ga3JCVkVZ?=
 =?utf-8?B?b3lINERBOHA0MWZsMUQ5bm02WlZ3eFFodFJpWmFEc1lsVmtCN0R0R21VWnZK?=
 =?utf-8?B?NFBjTDlwdExpVThkUGR6QkVJM1hkOCszUGlIVUN5UWl5a3QxNUFPc0JCNldk?=
 =?utf-8?B?S1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e654446d-3b98-4f33-c837-08dced075961
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 10:51:40.1438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJTqWPxJbwHQ9OEwiEq2ahLueAOUWtKUzqwamqYojcGmAF5Z6+EFQTIAh9uAqh0Uc86kpsiiR3dDmfLLw9V6Y6p2mmyjGykrQEpps9DPibQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9238

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

This patch adds the dt-bindings for NXP S32G2/S32G3 SoCs RTC driver.

Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
new file mode 100644
index 000000000000..3a77d4dd8f3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
@@ -0,0 +1,102 @@
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
+  "#clock-cells":
+    const: 1
+
+  clocks:
+    items:
+      - description: ipg clock drives the access to the
+          RTC iomapped registers
+
+  clock-names:
+    items:
+      - const: ipg
+
+  assigned-clocks:
+    minItems: 1
+    items:
+      - description: Runtime clock source. It must be a clock
+            source for the RTC module. It will be disabled by hardware
+            during Standby/Suspend.
+      - description: Standby/Suspend clock source. It is optional
+            and can be used in case the RTC will continue ticking during
+            platform/system suspend. RTC hardware module contains a
+            hardware mux for clock source selection.
+
+  assigned-clock-parents:
+    description: List of phandles to each parent clock.
+
+  assigned-clock-rates:
+    description: List of frequencies for RTC clock sources.
+            RTC module contains 2 hardware divisors which can be
+            enabled or not. Hence, available frequencies are the following
+            parent_freq, parent_freq / 512, parent_freq / 32 or
+            parent_freq / (512 * 32)
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#clock-cells"
+  - clocks
+  - clock-names
+  - assigned-clocks
+  - assigned-clock-parents
+  - assigned-clock-rates
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rtc0: rtc@40060000 {
+        compatible = "nxp,s32g3-rtc",
+                   "nxp,s32g2-rtc";
+        reg = <0x40060000 0x1000>;
+        interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+        #clock-cells = <1>;
+        clocks = <&clks 54>;
+        clock-names = "ipg";
+        /*
+         * Configuration of default parent clocks.
+         * 'assigned-clocks' 0-3 IDs are Runtime clock sources
+         * 4-7 IDs are Suspend/Standby clock sources.
+         */
+        assigned-clocks = <&rtc0 2>, <&rtc0 4>;
+        assigned-clock-parents = <&clks 56>, <&clks 55>;
+        /*
+         * Clock frequency can be divided by value
+         * 512 or 32 (or both) via hardware divisors.
+         * Below configuration:
+         * Runtime clock source: FIRC (51 MHz) / 512 (DIV512)
+         * Suspend/Standby clock source: SIRC (32 KHz)
+         */
+        assigned-clock-rates = <99609>, <32000>;
+    };
-- 
2.45.2


