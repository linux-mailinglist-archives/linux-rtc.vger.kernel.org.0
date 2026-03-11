Return-Path: <linux-rtc+bounces-6166-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +B8uCnf8sGnCpQIAu9opvQ
	(envelope-from <linux-rtc+bounces-6166-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2026 06:24:07 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DA025C662
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2026 06:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE6D530465D2
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2026 05:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9571B30CD9E;
	Wed, 11 Mar 2026 05:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="m37/5ZHG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023108.outbound.protection.outlook.com [52.101.72.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACB33112C0
	for <linux-rtc@vger.kernel.org>; Wed, 11 Mar 2026 05:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773206591; cv=fail; b=mEbKPxHGoIbT7P71SZ8/HQO9G+bxYrxBkCT42fC/LNX/0t1bXv0tuFluGQRGEQnOF0N1k6xC1V95dNYbokDLc5eq/zKMbWSwsntpkiUoPfG812gyTGu6kdp4cI4++MWxJNXDKnv6adi9Y+2ycNIrBUUByvas+duc+cpwukgHS/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773206591; c=relaxed/simple;
	bh=ctFYGB7aE+R0eXHrTwL004YLDUOAw/F56dXPt70QtlM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VHbLT3Jv9DR+Zf6GbyrpXXNQ5fT1Vnix0sirvH5Gg4HD0T1Il9BLmI/54bHpRWFMjcOmb6GZwB46NfbSJojDMblEy6XAyhbNlx7eHqoX/Kc+7IahROUydmN51h6qI3ToQCmpIbVXXbc9ZN5Naf9hn9hKMcPSSc/ZDyruVNfX0bg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=m37/5ZHG; arc=fail smtp.client-ip=52.101.72.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GinRKUuIqTkAD0loB01Co3v6y/aiWDxZpXjtL4KFKlawBw5elZB4+4y9YXpDcB/9a0eqW/CuLIvZLBYkw/vse5e8s49lwRx8Z3FEtKxJU7hDnlzlJoTnTq6fdSnotwxVQaODdAqsf/CVMSe3q/3zJQuZWHtTK3VqnA+PltsEe5R5byuo0Wp4nQZ+WJOwVKXzqXK9X7ZPj0FoHTlePOZc55IzsAPv4gbyYtgbGViu5+C+OKYRInokoK4iT9wAFAKCnsBhHh/LhSmCwSLxFqqrgPlBELvLW5dsSQQCZ80ENXewsqePXc8XBUEds4XaUGfuMuWAJAgBLjEFltDrqmePNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7CXCUc7slUoA/oN7sbJ7ngPeuKslo+CfriHl2QGrjg=;
 b=psqvm2FJmjI63HlQOstt1Bfn8hEXxei9w2QfSNrQSrlAnE7LYFrrKeDObQUpmteqEBT4e2NFUfA76oZWGVDvSRJDS9NTLQNHwMCNmACWcm0LUJukudsHb43Hm36tfxAJpG7n+O5I2zEr5cp9yB5wYwkGEb2l8ytLicUQUIfKnbJBKMaTf6w4UfOuO0iLluOZWgu/ivz1GECs32h+gkwJwrx5d4mLSBG+ZOIJtMON40jbh1aQNFO0AxCcN+CK3Q4VklgFDpg6uq5rO/lvWkv/Gh4QOlIiCToMRoDXdE8/R6z1NtK5fzUNSP6M0d+2/ALwP2zd4ufmCTMaZ3mP7Ppaug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7CXCUc7slUoA/oN7sbJ7ngPeuKslo+CfriHl2QGrjg=;
 b=m37/5ZHGNgwjXQQJJ9XAESfejnuxg7KSUtMGFXho19Jk4NuCdE2zduIZ9qvBSRFsItyd+GjsuUW3HUwOP76ntEYmxxPPPP+ZWH068oGnK2vKDn9C+WXK5pxDkyUOYD3jj91U1mYbyJUSQWzdr0BgnYPaa6jwYXxxJmh/iwn1gR35u88DoUdfUGmiLRUgKBLIssonpm2bUGgUHRy7hNIvWfZzP8yLlxSnZGgK4X17RvLNHUB80wQTN1ajDhvAS0Iry5MlQbPKlzOQRWFze5ENMfHIu5oh42laV2gL5XVOdsmCO4MZzg9RgkhoeS9wTvIAWZ5yFJA71VR2rJdDOG5N9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from VI0PR06MB10639.eurprd06.prod.outlook.com
 (2603:10a6:800:2f4::10) by PA2PR06MB9436.eurprd06.prod.outlook.com
 (2603:10a6:102:405::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Wed, 11 Mar
 2026 05:22:58 +0000
Received: from VI0PR06MB10639.eurprd06.prod.outlook.com
 ([fe80::3a41:90d:2091:bfee]) by VI0PR06MB10639.eurprd06.prod.outlook.com
 ([fe80::3a41:90d:2091:bfee%4]) with mapi id 15.20.9678.017; Wed, 11 Mar 2026
 05:22:58 +0000
Message-ID: <ac27be8f-363e-42e6-8b46-e95ab739762a@vaisala.com>
Date: Wed, 11 Mar 2026 07:22:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [QUESTION] rtc: zynqmp: CALIB_RD reset behavior differs between
 ZynqMP and Versal
To: Takumi Ando <takumi@spacecubics.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Cc: michal.simek@amd.com, Yasushi SHOJI <yashi@spacecubics.com>,
 kanta tamura <kanta@spacecubics.com>
References: <CAJACUaoFK-GiBN_hfkNajDUygnSZc29U_jdeQ_rKtXS7P1f-nw@mail.gmail.com>
 <9ed6823e-b381-4de5-b1cf-98f5dc54bb7c@vaisala.com>
 <202603061113298cbba29d@mail.local>
 <CAJACUaqHDJOZY-jgriGRX=DE=e3rvBgvycjO1exxQ7k1XdywpA@mail.gmail.com>
Content-Language: en-GB
From: Tomas Melin <tomas.melin@vaisala.com>
In-Reply-To: <CAJACUaqHDJOZY-jgriGRX=DE=e3rvBgvycjO1exxQ7k1XdywpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GVYP280CA0025.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::20) To VI0PR06MB10639.eurprd06.prod.outlook.com
 (2603:10a6:800:2f4::10)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR06MB10639:EE_|PA2PR06MB9436:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c30fed5-ede5-4b94-b68d-08de7f2e41cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	Oss8Q4Zxc+9RlcwOFzCkHdA75qmt2jRjcpoW2wllxRs6FUD0V10aBAoX3pNFT4j/eRHEIakImmve2M32E2olFytjCbHgNc1X6jaiIc29ZBtmrBvT9HKANp2GE0g3IZhEXpa4HNF3mqCqcSVdGV1za3mKe6qnxXPXusncfGgfQkzeeY28PtpacmF1WGSOkKEvx7LZCbZlVHe3zUhdDaJZJJEw8w2fwwhJpwmL4j1WLLgLipj6TjBBU5hOgbOhJxabxEyl0H6PvPI7vVW+TM7OYN2rQZboRskWMD96+qK8GjUfNWnD01b2J3NaFrU4G5grqoVg7iimLuXv2kpA++jTQ9zWBwgmtyco6RcBZWHSYMJlw22c4kgwysa8EjIFHW3QbU0Kkn4+4TiSgp/ofIpteckssZodAIlb6OUU212HCHO1IMRelFZ6mr7bpJYqUWnrZHpObVN+uU5jroiKSunQpGZpb4Xdn4gB2m2RYzjENCN5219pTfamT6+8/q5gFyGnTa3Pvo4FdPKZtgyly8S1/mJjLDhyDbgZbkj3QkoKbYuybUA2Ki6ES9zpFF32FOsWdU8bt3B3w1ldJ5csdqbyQfuuU/7pBJ2GmNtFjITDJ46CIVcBnHJRHT6VYt3vQzYRuxfwNOcENd4PSjX/uLZETW/QWECJESl3yv94ImiabdXPnhWEEG0UfbdrRfXUHg4U
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR06MB10639.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnpFSExmd3JaaVdHbUd5NlFWMExwUWtJYTUyYzRNWVZka1EwZS9KUW54MzRH?=
 =?utf-8?B?MzFyQzJOVkRoSXlIN2U2RGRYSEZuTTNQcGZEbjY1V3RzeXJqdGN1ZEpUMTZG?=
 =?utf-8?B?MWRTZ3hRLzlSNDlCS2ZOaUNEeFIxSXV4Mk5PK2haOGJEWW9idlhUajVFbXJn?=
 =?utf-8?B?OHpRSzJQMFBGYkw0K3liMjZCSEdQM01RMlRGWjBMd0lpTENSVTFFeTNUejBw?=
 =?utf-8?B?eEZlcEdySUZmVEdBbG1KT0hBQm1TM0M5MjAxSHV2eW0zbkF0NU1RaFh3L0Vi?=
 =?utf-8?B?WlRjb1lmTytiT2NzaGIzWHFqWi93QVZoZDhTSVJtQ0tBcnpaczJKMXRtazNx?=
 =?utf-8?B?dEFJamhQZkFpVnI2Uyt2Q1RDeHpNSnUyN0JFK1ZiWVZuNkp2bjNkTG5SK2hV?=
 =?utf-8?B?bzZ3MS9kQmFWb2xWd29aUm1FN1FDeGcwRitpQllRL3BVNlFabE00ay9FSkRC?=
 =?utf-8?B?MTV1emFpZVJVRzZNdlhCd3RYRE1hdWhhVkduZE9CYU13UjJQZTFhRWlSckdE?=
 =?utf-8?B?TWNIbXpGRnptT21UTzI3NmJQT3BEVDYzTjZaZHBlSXY5WllmV2FiRHVZc3Ny?=
 =?utf-8?B?RmVUeWplWnpVY0xBZmZZZ0dOdlA4Rm42Q0RHbC9xSEtCSnVmd2hwQXZaeElP?=
 =?utf-8?B?VUhZZ2xwditocEdBTm1zUTh4eEwxcHkyL2JzMTlBRDZkeXN5SHB6VVBMdVpM?=
 =?utf-8?B?S21nME5QZnZ0UE9IZlJLNHF0RGRtOXJJQVRHdWRrL0NIaDloYnJzUFpZb0ZU?=
 =?utf-8?B?KzFSZWNyeWRWM2hmbXpUalVSdlZBNVNwY3V1Rk9rSGdUbVlMVEtDalRySE1i?=
 =?utf-8?B?U3ZzZWRJVkV1enFkYkdickUxV2JjTUlvTjd1SFFRd2FSRDZ4L243bThzTG1E?=
 =?utf-8?B?UHhROXBWaS9XYnRFTk9PVTBwRWpvcktLZGdMaUZtYW5pQkwwR3E2dDZnRWpt?=
 =?utf-8?B?QzBCWlVHT3M4ZzNoeE4vZEJNWW5LOVBhNkVEbENhanVMMXJ6Tk5BT3haMDRB?=
 =?utf-8?B?NEhPbmwxT3gzN2VrQS9LOHBDZWh6OVYycEJLOG9PK3lyTXVHb0pmdUMyMTV0?=
 =?utf-8?B?eWVDVUltMWp5V09WODFGc1lPYzZSSHk2aHplYTZHb3k5VEFRR0EvS2V5ZlJx?=
 =?utf-8?B?NWRubXE2RkttS0NsS0lEWDRvRDNod0t0WmQ2dlpzbVN1RC9DU3NmNnJITDJq?=
 =?utf-8?B?aUxvbmZ6dmpic1Z0SjMyT3FVRTRhYWxLR0pZRnYwUUE0Z1ZHMDl6OXp5b244?=
 =?utf-8?B?K1NyaktoSDJXSEhjNnc2VDQ4VWRjMGtvTXd1RnF3elZPSVpodXgrZmN4ai9S?=
 =?utf-8?B?d2JwNHZBSFloV3czQWN1N29NeXA0aEtXWFJKRHZiT3VVZ3ZBY0lXRDRRWnJM?=
 =?utf-8?B?bks1U0I5ajQ5ajE0MDFxNjlkZzhTS2w4ZTQ5Und4NFRlODlRMzkvTGVkU0s5?=
 =?utf-8?B?ektidXVYbVN5bGlLUVVINUEwK094L1ZWbS9WOHVYUmwySi9RaHlhNkdTM3Qw?=
 =?utf-8?B?c2Fsb1dVTGNHazFNWUpoQW5kTXlGNE1ZRUFwR2sybkFMR25rRG41aUtSQkRO?=
 =?utf-8?B?MTltR21Ed3RBd2c0TTk3aGVFMW1JYWt5bkxlRmcwVVpYREdUMk9WMHp3U0tm?=
 =?utf-8?B?SEQ1TzFwdFlGckdkTVpsQkhvbm13ZHgwd1VjTWF0N3FDU050dlJVNjBHQ085?=
 =?utf-8?B?Z29lbk4vaGZlRnFVaklzWmVqVDhIOHRvb1J1V2FnbXQ1UGRWY3orRXRDTlVr?=
 =?utf-8?B?c3RoaGtUNnZHSkRKY24xcUpianlxTjFNTUExUWZvSURsOTV5cjdZdzkvV3V0?=
 =?utf-8?B?YSt1cWJVNkNDWS80VURGRnpiS0hOd2FHeGlkZnlJVE5VK1ZLTjJDVUwrVzIy?=
 =?utf-8?B?RW1OVVRHZmpGUkYveDFGTWFQekppemNZYkFSZVlkS3ltRWp5MHBZOGV5dXVF?=
 =?utf-8?B?MmxVNjRCRmt0U0ZVM0NTV2x3TVAyMVgzNDl5RTBhZjZ1YzlwVllrb2czWEdh?=
 =?utf-8?B?SmFOR2NRbFBVNkZDQTRUUHVRUXZRSGY2ZUw0OTVyVU9GNGdPa1duL1N6QWc1?=
 =?utf-8?B?UXllYmN1VkRDYVZYNXlWL1R2a3hseVk4WUVYQzNmM1d4RHh0Vm1odW9DY1BI?=
 =?utf-8?B?dGp5TjlaTTJaM2dXb2RsN3RJN3IxWWxxc1NuK2VMMWkvQVNFdDBOSVpibkVa?=
 =?utf-8?B?NWt1NWRtdGRtNHpobkN0UTFlSzBmWG5HR00zZVZMSmZ6L281YnZIcEZqNE1U?=
 =?utf-8?B?NVN4WStwS0QyUzNtR2tiZmZ3WHZibHdYQU1wMThEUW9GWnhJVHVQRHZSVm1h?=
 =?utf-8?B?YU4wc3BMTGpoVCtqNnlhN2t2cXdoK2g0MHZvMWU0WVJYN1VYZVkzenVFRk9k?=
 =?utf-8?Q?TTkgJ/iD4XW5qFIU=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c30fed5-ede5-4b94-b68d-08de7f2e41cf
X-MS-Exchange-CrossTenant-AuthSource: VI0PR06MB10639.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 05:22:58.3641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DEzmafe4hrQQl+VXvgbWPfC0f0J33ms8Bz1xlx0QkUl7Ykt1mx8oyLR3TRd2Oy1lgARSo8ruwYO9KYrj5GQQHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9436
X-Rspamd-Queue-Id: 61DA025C662
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[vaisala.com,reject];
	R_DKIM_ALLOW(-0.20)[vaisala.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6166-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[vaisala.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomas.melin@vaisala.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,aka.ms:url,spacecubics.com:email]
X-Rspamd-Action: no action

Hi,

On 11/03/2026 05:19, Takumi Ando wrote:
> [You don't often get email from takumi@spacecubics.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Hi Tomas, Alexandre,
>
> Thank you for the explanations.
>
> So if I understand correctly, both on Zynq UltraScale+ and Versal,
> CALIB_RD may return a non-zero (or otherwise undefined) value after
> reset, meaning that it cannot reliably be used to determine whether
> the calibration register has already been initialized.
>
> While the fractional calibration should indeed be handled from
> userspace (e.g. via the RTC offset interface), it seems that the
> Max_Tick field should still always be programmed according to the
> value provided in Device Tree, since it depends only on the RTC
> oscillator frequency.

Both max_tick and fract_data might change, it depends on how big

the calibrator drift/offset is and if it is negative/positive.

>
> Would it make sense for the driver to always program Max_Tick from the
> Device Tree "calibration" property while preserving the fractional
> calibration bits currently stored in hardware?

As Alexandre mentioned, user space needs to ensure calibration is what 
it should be.


thanks,

Tomas


>
> If this approach sounds reasonable, I would like to prepare a patch
> for upstream.
>
> Best regards,
>
> 2026年3月6日(金) 20:13 Alexandre Belloni <alexandre.belloni@bootlin.com>:
>> On 06/03/2026 12:09:40+0200, Tomas Melin wrote:
>>>> On Zynq UltraScale+ Devices Register Reference (UG1087) [2],
>>>> CALIB_RD resets to 0, so the current logic works correctly there.
>>>> However, this assumption does not appear to hold for Versal.
>>> For Ultrascale+ the calibration register also gives random values after
>>> reset, perhaps you have noticed this:
>>> https://adaptivesupport.amd.com/s/article/000036886?language=en_US. Maybe
>>> the same can occur also on Versal.
>>>
>>> AFAIK there is no way of knowing if the value is correct or not after reset,
>>> so user space helpers might be needed to maintain the calibration value at a
>>> desired value.
>>>
>> Userspace is always needed to put the proper calibration, there is no
>> way for the kernel to know what value to put there. In the support case
>> above, the crystal will never be exactly 32768Hz and this value will
>> change over time and also depends on the temperature. The value always
>> needs to be computed, if your device can do NTP, chrony will provide the
>> proper offsets. If you don't have a way to measure the deviation, then
>> userspace can always forcefully set /sys/class/rtc/rtcX/offset if it
>> doesn't hold the correct value.
>> There is no need for devmem here.
>>
>> --
>> Alexandre Belloni, co-owner and COO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com/
>
>
> --
> Takumi Ando
> Space Cubics Inc.

