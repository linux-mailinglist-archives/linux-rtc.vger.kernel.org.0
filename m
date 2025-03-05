Return-Path: <linux-rtc+bounces-3405-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D68A4F682
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Mar 2025 06:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B17EA188BC2E
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Mar 2025 05:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA6791C84B4;
	Wed,  5 Mar 2025 05:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WbIaJEeu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YJuhKKRR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBB52E336D
	for <linux-rtc@vger.kernel.org>; Wed,  5 Mar 2025 05:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741152271; cv=fail; b=c6Jcbut5cab1nNdh027xEHmH+zAsaxwYUtvun37Q1b7sRGaJqEAU80qqOFCOPQZEwvXMDt8Ctf75yJF/CnMS9cmbKaT+mNAXjFBEG7crULqzdZ8LsAkKJz50CaMtGuZvC5aO3pZe2objinYPglIo0wjQgtT0aFc2cr2O3zULioc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741152271; c=relaxed/simple;
	bh=aRyUDPR79p6JHeEgs3URoe+7m8KXimFxT7SWbS2eIfU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fEWHTbXtaE6QV0Wj1bT+6Uyf/GNvmzgPte28wUo/ZMkGPzJ82rA6IQDqRWVfnSDgrvoeYPGK7cHA8k64IBY7JYpnctf1xLBjoyXKG0Bt1Zu1kUswAUuJrTO9H2srrTOahyTeKvfwPrAL/qFZi5V4kw9bMygUFyRIHleVpyMKhho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WbIaJEeu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YJuhKKRR; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5255Mg0J008007;
	Wed, 5 Mar 2025 05:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=QU8sqFgCKYAJZajNuvtuY8JvwOuU/X7He3I0/NLQh1A=; b=
	WbIaJEeuR6hS6si6gAB2K3JedN5KnZABnJ67wEbL9hMYvojmLMsftp8lqhgR3oBc
	zTrCH6pZ61xKi2Xc1zrjCZ2T7o5fXF9x7rbYVwQqGA3KLyIH6E1IZ3ws7dVti3U+
	zekkUGVMMAsYQsuMxfYHniRozUj/BZ+pTnpQwPX/D0qHfapPQ1vHnq277OGmXNeM
	J9UR3kfSr8cP/LR7EGaaajvqxdd2Ayr3FBPjP4dhVqnPJSV2xzZT5qWJZ5CoDVCm
	ueQI31DH7MLEv8DTSZW2/WMs49gRvpzed7f+pPhRg/hND2gxmBfdt4Dko2U7B7fA
	6bTLveEQ0/9uPn/gLeZDEA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 453uavxp7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Mar 2025 05:24:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5255DS6v010885;
	Wed, 5 Mar 2025 05:24:23 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 453rpbf5aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Mar 2025 05:24:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJ9C5TbBvzt6tXiH/zUr60x8bZ96Qtyf2yBJlraDd7xim756JoT93+uA9exA6rJ3qLOo5ybk+xGgAYyXVljigzpkH0t/RU56rKmVP/mF54kUjMq6hyzO821e1L1VaQe4WPBoaUaM/wi6Jfr8iDDRjFWSmSej+i8dmkntvmCyON8TiH3n8QozE2BmjVtQ+6tvoPuC5ZW/ZEJrjA0HRKy4cqWMvyAXFqUP0iSwOX5JnxR51bU/leHHyW8dN41bwu0j3qNi50yWOF6VOH45HcPFgWLrPUYzi4Ua5Iz2rbQerzsjCC2Uf6jOIOTSwT8gCF04eXrWVBqEtN2/dg1bge4wXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QU8sqFgCKYAJZajNuvtuY8JvwOuU/X7He3I0/NLQh1A=;
 b=NlrNLXRFd1WFRHswitNnnf+OnyhtqBn7OTPwAIdZa1hTHy90o9RtSPWNthK8q+yaFFKIOw/wpSaE0TZnA7G3tx8ITBiYYZcmCeZt+20ZsKBt1v+URoANQ+hKdxVvOqj+Dl4gg5JKKh1zw6JleaFCmrQOFC3MOpIylQfsFWmmDqeH/FXv3saFMHjRP7kcaddVGQ+QP7b+ahRmf1FAlSKiX5Za/8+vzFXFAX729uRi32+xr3A24iRGZElctFf+NRadD6E5Wcjb8a6Gal9EJkC7pdvYAuvZL2yW563DrRpN+NECt3TZad8dDY4z+sdokZSxda2P6a6zhNdIKtYg4uA8bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QU8sqFgCKYAJZajNuvtuY8JvwOuU/X7He3I0/NLQh1A=;
 b=YJuhKKRRX1RVikQtR7oPBb5WUoxFwQWRpsxlGsQ6Y22aWJnXzl3gCOv7x3IESv6/6EQdO8cXGsibb7Ie9l3qSO1yd/F28mXwsmRD9eK3o+BVl1XbuzuRAZ0g8xjV7gABkAkfoaEiq+3ok5g3xy7D1dcpsSMhefmC9fzs+uQ4cb4=
Received: from CY8PR10MB6707.namprd10.prod.outlook.com (2603:10b6:930:93::22)
 by PH0PR10MB5706.namprd10.prod.outlook.com (2603:10b6:510:148::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Wed, 5 Mar
 2025 05:24:21 +0000
Received: from CY8PR10MB6707.namprd10.prod.outlook.com
 ([fe80::ccf3:1df:e15d:7465]) by CY8PR10MB6707.namprd10.prod.outlook.com
 ([fe80::ccf3:1df:e15d:7465%6]) with mapi id 15.20.8489.025; Wed, 5 Mar 2025
 05:24:20 +0000
Message-ID: <75a1d5d2-8ec7-4496-8c24-2815bb6414e5@oracle.com>
Date: Tue, 4 Mar 2025 21:24:17 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : Re: LTP rtc01 RTC alarm test fails
To: Mario Limonciello <mario.limonciello@amd.com>, rafael.j.wysocki@intel.com,
        alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org
References: <dc4c018c-77f0-4cd1-81c8-929f40e6162f@oracle.com>
 <759f4d7e-de8a-4d04-a6b4-e138c02167f9@amd.com>
Content-Language: en-US
From: samasth.norway.ananda@oracle.com
In-Reply-To: <759f4d7e-de8a-4d04-a6b4-e138c02167f9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0410.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::25) To CY8PR10MB6707.namprd10.prod.outlook.com
 (2603:10b6:930:93::22)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR10MB6707:EE_|PH0PR10MB5706:EE_
X-MS-Office365-Filtering-Correlation-Id: 80dcd052-bae6-4a2c-9c2e-08dd5ba5fbb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1NqTnNrdDZQNW4zdkhtalN0MTdUejlPUFp4Vnl5V1FQMWtRRnJieEdqSklX?=
 =?utf-8?B?ODlUak91eWlXYXBPNDlRblh5NmN3bkg1V2VEMVozUEl6TUVzSHRESm1UajBC?=
 =?utf-8?B?ZDRLUmlMM0tsSE9ZaUhaeHNRcHpZV2FteHozWE1DLzloaTkvamMyUFVBaTZq?=
 =?utf-8?B?ekRIZTBYenBlbU1MeFlVdytZQmw2OHRqN1NGc3p6SG42ZHBCTzFtQUhGN0F6?=
 =?utf-8?B?Ykg4anlvcW9JeEg3Q1h1R2xHbjNxTmlqb25lSW9ZWjVhZ3VDS2dUZXdPVldF?=
 =?utf-8?B?QjhXN3RSZFp0TG5OVEJrSlo1SE1Rd25JdEJSakpOOTMxeVZnZXI4ejNEMC8x?=
 =?utf-8?B?RFFNaUZSTnltSnE0Z3EwZTdWK2JjMmJmMWQxZThQSTVmL2p5VlFtZUxmWEQy?=
 =?utf-8?B?cW1xV0xUb0wxZE95aTA5SmxqMXRTZDdNUlNldEc0czJGUjhDL203b1hYVmlk?=
 =?utf-8?B?NHo2QWNXbHVFdk9UWDloL1hKcG82UHlSR1M3bkM5ZHZxY01EZTdCTFlVMk0w?=
 =?utf-8?B?MmxOK0tvU2dIQ3Zjb0dNSEZrK0NpYzZwNkc0RktsRkxnT1FybE9OanNveEFh?=
 =?utf-8?B?U0hFUXdKSFA4NU9ZYzM1NWxaVWhaaGxVdmpvYjI0ZUczM1dnb0dKdG1hdG02?=
 =?utf-8?B?ZzJlVUlhY0pTZkVtcjNvZVduVUVDTHErWVY5MUhMQWlrNWtRUFFqeCtYc1Fv?=
 =?utf-8?B?TXRmTDVnVDdpNTdRM1pHL3B6K3hMWmppOGxzWXdKQnNkUjdNZ1crNzJGelBQ?=
 =?utf-8?B?bGFnb05Dem5uZXNGS1RETVA5NjFLY052TG55OWpBRk5HUlcrd0NwL1dVSERP?=
 =?utf-8?B?YVdtK21ITUZKWmlBbjV4ZEQwTUVXVlVIRFhJV1I2UDBKZHpBR3JvM1ZaMmRU?=
 =?utf-8?B?eEVzU3pJbFRlRkUxNUxydmpHU1Y1bDlqMDZxd2ZIc28rWjU4eGcxQ1RxR1Bq?=
 =?utf-8?B?QkNPQjdCVW1uUnlLdmk3ZVN6RmNoN0NvQTRLRVFHYzJEdG1BYVVaQmdkVEp0?=
 =?utf-8?B?aWIrMUlLM25WQVZicWlpdVhNM0dEREUveGxnRkJRVCtkMm1Qd00xOENPL0FJ?=
 =?utf-8?B?eWtNQlFoeGl6b2Y3UzB3cE9VYTBTemJjVkdkWk9hYXVIbmloRi9pU0xQVlU2?=
 =?utf-8?B?VUFORVZRWWpWdjI3WkNZNVdEb0k5TU1tMXp3ZUoramhtWXJPR3RudDc4aUtG?=
 =?utf-8?B?V2JMdFFYY1BIeSs0R2gxK1QrOG90aE9JRFVLdW9BOEhEekE2ZmxKdC9XWTR3?=
 =?utf-8?B?VkFPeW4rV3RiUVZ1WURKaHhwblNGYzAwNGFPMU5hdjdvc1VGNm9hbWt1NmJB?=
 =?utf-8?B?dGVBcXJOMjBXSG5kNUphWWFEeDBHbk8wcHdNeXJyZ1lXcTZqaHlsRDZtUThw?=
 =?utf-8?B?T2Q1RjNWUmhaWUxmT2dRM0VDV21FQk13OGh0U0szNk1zaUgxdUJFUmlGaGY5?=
 =?utf-8?B?RXgrMzRzYWlrUHRkOWJoZmI5NnhrQ0tCSzNEUzFDVTl4RTlJd3JMZXVUVEJ0?=
 =?utf-8?B?YmxqVkxpY0lBbUp1T0RkaFIxSUNWMDFyVHVhSnBXbVFzSzQ3YzI0SmhpZWs1?=
 =?utf-8?B?UnZESUg2TXF0UlZVUFN2TzhuSC9Oc044ZCtqWndOTkNXK2k3OS9wUXF4K0Z0?=
 =?utf-8?B?YnpCUVdsQ09uRVFqTEw5NWRDNTFUNW1ubFVXSGk2Y3dEY01hd1NkVVZYKzls?=
 =?utf-8?B?R1VUVUoxcEV6Z3N2dm5rTmtiTHBLV0ZLSWxlWk05RW5wZGIyVjZZTHgwL0pE?=
 =?utf-8?B?NkwzNUVQK3FoamxFTGZhL0JtZmpxZTZQelVPZThUdEpFWlFqSHZnV1lIMVpU?=
 =?utf-8?B?dmlKYlEzOXBldTNNNExpWDAxWGdxamdpN005WEswMkE2cG42RkZ6MnBzdkhY?=
 =?utf-8?Q?Fg8ottxv5CwjL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR10MB6707.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlV4dXd2Y3E5bkZENmZiSmxDUVdjd05kWHRIdG1jbSt2WDFSUGdiNmFvZzVh?=
 =?utf-8?B?ODZsaGZVZWR0VWRWZlFCK04yMU9HV3hhdHBmaWozdE95dEZ3RjBtK3g5MzEw?=
 =?utf-8?B?L0pnc1VOVVk3bVhpWTdOSWtReHdTOXprcWlITUowYmZjblJ6TGtBeVVwQ3U4?=
 =?utf-8?B?eC92ZUU3Qnh6bmpqUEdVcUxWNkRScXh5VEplMkRhaWJwYVhCTGtrYkljNmk1?=
 =?utf-8?B?V3RGRmlraE0zckYyVXlaRHgvSHJtL0NReFZSK3BnYWFSSFpzV0txZTVqV1NK?=
 =?utf-8?B?TWNML3lZUWl2Mjltc1I4WWo4SXZucmNVaFkyNmJOdEYzZzBrUjRRMmVBR01S?=
 =?utf-8?B?RDFkcVdSK0s3VXZtSzhyM3lDQ2tWcUZMSHFsWWMyYW8xRmZmckRuWmNKUEtv?=
 =?utf-8?B?UE9xUHB1QVNvdnRhUjJpTkM1aXppSE10YUdxeTMzaXNWWjlWN2JiMUZreUZa?=
 =?utf-8?B?bmVvMjNYT2tKSHN1YStiTkZCWDNTNDJjQndFK3kzQ3Z6ellQZ2JYSW4xamtE?=
 =?utf-8?B?Zm5VbldPczEwdG04OUNZbDhZQWw0bEJrRjdxTitPdC8yb1dBRG55ZXo3TFRL?=
 =?utf-8?B?cG5NRWwxT2JXem9Nb3J2N1Zrd2l5K3RBemFDQSs0RENuUzJFZVRTMUw1R1FR?=
 =?utf-8?B?cEZyN2pIb24zVG1WeUcrbTRrVWlqeHlwcFI2d3lzeXY4SmpBYzl4S0w1OTB5?=
 =?utf-8?B?S3J4bzliZWtoN0h6M0c0b1lwNlFielFQMmI1N3VRNnZROGgveVcvU01XUTNN?=
 =?utf-8?B?TjAzSVRiSFRpM3dFOGRRVW9YWHJCVEVnNitYTFFGTkpuRVdMWE5WTkdSUEJs?=
 =?utf-8?B?TTk3RThkRHF6THp2TUtMRVZCbkthaGFsYUo2ZUdYUU41N2tFa1B3Wks1b0ZE?=
 =?utf-8?B?QmtVN3JFeUtOWFdnZWlQWWVwQzFhcHJqSm8rWkJMaEszU2NmU2lDSklocG1E?=
 =?utf-8?B?UTNZRGloL2UwTHhNMXZQb2hjNVcvSlBXVjRQN1JWdDIvQ3FjSFlqQVl0MmY1?=
 =?utf-8?B?ajFHakpjZTZveGpSM09ocWpQNk40bVdyY1oybXZXRVdpRWtNQzl0QlhNYUZm?=
 =?utf-8?B?ZldnbVhIUXVqS3AreU5JWGoveTFPeElMNnAyZUpldXhGTFY2di9GUGMxaWI3?=
 =?utf-8?B?Y0hJRmFTcENCRS9Nb1pWazU1TzJFY284eU1oMFd3WTBFcDRGUmhlWUh0YzNp?=
 =?utf-8?B?MmxIdEczSDdTbXVGUGhCcjdHbVBBUC9zcVNvWlIya0EveTgzSEp4RUt1b1RS?=
 =?utf-8?B?SFExZG9kZ3NDdmo3enduRklZOXIzaFROMkp6L2t2cElkaE83bUgzZjcxbDVX?=
 =?utf-8?B?T2p3UGpCNnlzUFErUmpuVDRPd0g4dGwxeElFamhoMFliWTF0MlVxVm0rcUM0?=
 =?utf-8?B?OXc4TUJhbVNYRkZsSm53SVdCaGEyT2Z5U3UxRy9hU0VaeDhGTnFCSE5zMCsy?=
 =?utf-8?B?SDhVaktRVldWcGxIQjRqcE5wSVMrWEVBeUcyd3J0dU41dEdacy9WRlhxeGpa?=
 =?utf-8?B?dlZJb0JFWGxEY3g0TjcrK3h1SUdqdERpM1R3OWdtdEZZcmxyYlViK0lIa3l3?=
 =?utf-8?B?aDV1Y1cwWHpVd3A0b3p4Z0RwelBBajRuMG9OZlRUVjRpT0NzUm5Na05kbnd1?=
 =?utf-8?B?dUxDQ0hLcVZucURTOXZBRmlRVXdEdi8yRWV0d0tUSGd4TGpQQmpQamt3V1dt?=
 =?utf-8?B?b0VFSG9LNTkyZ0hJUUYvYmc2Z0wyNU84cnRhaU5vTWFNdDgwcWtGaWV2VVhP?=
 =?utf-8?B?K3l0VGoyM0s1Y2IzU0hGNUVWSEh6RXROTWp5a29Vc3hZTzNjRStYcDB1SHlr?=
 =?utf-8?B?N29lbzdack15VmJFY21GL01jMW90cUthTmd2Q2FHNWhGUXNieHljRzgycnRY?=
 =?utf-8?B?ZmxGYUZ0Zy83bXlIYmsxMmMzNElPS3NRUzRLMG1CYlNhU1dGc29BYStUMXVo?=
 =?utf-8?B?aXRMekNMQmlVR29CZFFmN1RWVjV2Y0ZTTjg2NW4wK3dyR0h0ekRsRk1HNEda?=
 =?utf-8?B?TC9WYzBmb1U2bkxRek80aXM2TGpZbGVZWjMrTkRXNW4vSFpDTnFsWVg5Zk10?=
 =?utf-8?B?NElZZjR4bVhPcmNVNSt0RFVSaXpXeVRBalUwN0RYMHZIc3kva2c0c1RXZHUv?=
 =?utf-8?B?WFduK3lTaWhxcENybks1cU9nN1BvQXVCRThsOGsrNjFhcEdpWlRTVUVZWXZO?=
 =?utf-8?Q?X3W9qynCgFdEvZpF1I92oO8=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	t7ry5f2eLuXbUeaz7qDEduJqmPAsaAwXd2qYL7K1cYH0mELMqT6rLld/gakdiWfoMScXgsYTsFLJ3cbVBPjMqX2hSqW0NqGHYr/X5N//D49rKDkwdMG9QoLW9S1hN0IAqdrWq05afLGizKh8kxYXMB9A8xtIG978QCDPlFJu/9RBdSTeSjQXt/B0QgzXnZBZY/al36a0e5awYNTgRj3TayGkzSx67Op8mDfv6q2kD89D/YoWE8gnQyh13lER0TKflio41jlo01ycssOyK6anXhQHlbt2T+yNlR5OlGGAfRgZ/hzFLGCZ9FIu8y/2hw9f7nYkk1gi6GyLlXiTPKelau73bW8sAP5a+/rWRnfbM6BfS1KEIK3D1yqD/rUZIvtRgqmcsk0e3Ietnq8i0KgNYfTASzFOdt9c2SDo4un3fQ4w/htfufCyyqywdEg1ifmHpTYTtduBsCrwu+pujwZ1hp0rX00qY4EaeFy6DiPsAwS3BXf1COwAEwRHzp4CJWlV2EgkIktXbkJRneQUuJ5r8/KtOJq7ga2gd2EyVg/tkwYDsxBwa/x7xojf3joUYZv1b7F94BKO1n8bIcI9th1ybs3xiD+ZNxSmof5yNJRRLFU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80dcd052-bae6-4a2c-9c2e-08dd5ba5fbb1
X-MS-Exchange-CrossTenant-AuthSource: CY8PR10MB6707.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 05:24:20.8516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JAZBOlt+zz+VNc1XZwLU6eioh5/BlX/kUGQIAeCnTqcg8LAKH9ocgT3OoCU8oYQqHdmCm3rgsA6Wf3yrsF2B6hMGlr7WmP63lwzouMlyfi7hhFikroG0mMsjz5FxC7tJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5706
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_02,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2503050040
X-Proofpoint-GUID: A7D_g06qxnxYSFe3nBCHzz0rqyuTaxdr
X-Proofpoint-ORIG-GUID: A7D_g06qxnxYSFe3nBCHzz0rqyuTaxdr



On 3/4/25 7:00 AM, Mario Limonciello wrote:
> On 3/3/2025 17:48, samasth.norway.ananda@oracle.com wrote:
>> Hi,
>>
>>
>> We recently observed that the LTP rtc01 RTC alarm test fails on intel 
>> based VM's. This seems to be observed after the commit
>> 6492fed7d8c95f53b0b804ef541324d924d95d41 - ("rtc: rtc-cmos: Do not 
>> check ACPI_FADT_LOW_POWER_S0")
>>
>> I noticed that the use_acpi_alarm was set to "N" before the commit, 
>> now it is set as "Y"
>>
>> # cat /sys/module/rtc_cmos/parameters/use_acpi_alarm
>> Y
>>
>> #./runltp -d /tmpdir  -s rtc01
>>
>> <<<test_output>>>
>> incrementing stop
>> rtc01       0  TINFO  :  RTC READ TEST:
>> rtc01       1  TPASS  :  RTC READ TEST Passed
>> rtc01       0  TINFO  :  Current RTC date/time is 3-3-2025, 21:02:20.
>> rtc01       0  TINFO  :  RTC ALARM TEST :
>> rtc01       0  TINFO  :  Alarm time set to 21:02:25.
>> rtc01       0  TINFO  :  Waiting 5 seconds for the alarm...
>> rtc01       2  TFAIL  :  rtc01.c:151: Timed out waiting for the alarm
>> rtc01       0  TINFO  :  RTC UPDATE INTERRUPTS TEST :
>> rtc01       0  TINFO  :  Waiting for  5 update interrupts...
>> rtc01       3  TFAIL  :  rtc01.c:208: Timed out waiting for the update 
>> interrupt
>> rtc01       0  TINFO  :  RTC Tests Done!
>>
>>
>> I believe that the hypervisor may not fully support ACPI or may 
>> implement it differently than physical hardware. ACPI wake-up events 
>> may not be properly supported or may be emulated differently in the 
>> VM, causing alarms to not trigger correctly or time out.
>>
>> On AMD all instances the use_acpi_alarm is set to "N" so no issue seen.
>> On intel Bare metal instances the use_acpi_alarm is set to "Y" but no 
>> issue seen.
>> But, on intel VM's the use_acpi_alarm is set to "Y" and the issue is 
>> seen.
>>
>> I even check with
>> # acpidump > acpidump.txt
>> # grep "FADT" acpidump.txt
>>
>> no output from above saying that ACPI_FADT_LOW_POWER_S0 is not set.
>>
>> Is it possible to know we can address this issue? Should we make 
>> changes in the LTP test itself? or in the kernel?
> 
> I'm a bit surprised it didn't also affect AMD; but maybe that's because 
> of the specific date of the "BIOS" for the VM.
> 
> To me this sounds like a hypervisor bug though.  Could you add a 
> condition to detect this hypervisor and exclude it (and also report it 
> to the vendor for the hypervisor "BIOS")?

It's not affecting AMD because of the first check as below in the 
use_acpi_alarm_quirks() function.

if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
	return;

In AMD systems we return control right here and the use_acpi_alarm is 
never set to true. But for intel the above condition wont pass.

I added a check to find the hypervisor

cpuid(1, &eax, &ebx, &ecx, &edx);

if (ebx == 0x756e6547 && ecx == 0x6c65746e && edx == 0x49656e69)
	hypervisor_name = "KVM";

I was able to detect the Hypervisor to be KVM. Do you think that the 
issue is due to KVM?

Thanks,
Samasth.



