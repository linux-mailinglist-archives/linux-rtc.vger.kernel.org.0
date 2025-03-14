Return-Path: <linux-rtc+bounces-3498-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1712AA61A15
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Mar 2025 20:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 433964637E9
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Mar 2025 19:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEF8204C09;
	Fri, 14 Mar 2025 19:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kCcyno6J";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="c+Nb2jAt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2870E13A26D
	for <linux-rtc@vger.kernel.org>; Fri, 14 Mar 2025 19:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741979173; cv=fail; b=AssKv7PBcLkYBtQxXuM6hKwSR2b1rjLWZsfsZQbCceAUOf0WDLpwic0BYp0vJpiUrtzllhFMGCFJ5PPYc6e5Y/OKmi0DPMMql9PsWpnSmL1hWclEfykyHNYUoLi1WsEptNK31upnQd5/76Qfx3yetFepmI/Pjc+7fhWr5FA6jII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741979173; c=relaxed/simple;
	bh=acAFAgkwfBgJwCQPhG4ZD83dql6erzKGvVjM0cRQ/h8=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=g+l/UkUPH+APcZ38O7P2mrZZEhu2asbFXnOet/wbufSrmNNIqK2SaD1EJjCpOrrJOq73xm7sp5mNjfOoTj4C+09g6gnaUajWjb9wbsXl2ezsPJbWISmnCYNG2WbAPNLAk5cRApqfhZ3Vi0ByCE3oDyPQMVn9eKtBY4hSaJvdO+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kCcyno6J; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=c+Nb2jAt; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EBlq0c017167;
	Fri, 14 Mar 2025 19:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=7oeOXbnYOTwc96AGCua4iIszyJbrn1EYwsnffqUl7Z0=; b=
	kCcyno6JLHDmBQucZodptsDabD891xhvDIwfAY7NQFpy6LobfYpqdS3Frg6hdte7
	wLflhnxNXGLdkmImde94SRMpCGI4XGZOolZOJ/c8lvmBv7roe9jBSkStoE5QThmD
	urNDIEdjoFCuMa8aBDWslXJ4CP1wZM23OfGAcL0UznLMz9wy3+U12ZobXwQVZx5M
	yGxL2u5uKSgOBqhMkrWGGJdHauDj8VTlDIlMnXvQytXtOMkYrMbHjnlEOxtBG24X
	ncAS6aAUrGQeqJMrtNlSEttCP+mSXOCVL0WfEcFuj0XMG1p9vxNBYNVhhcv8IW6G
	184492fxqRYQJvZ54FddKg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45au4dq4fw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 19:06:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52EI1m66002149;
	Fri, 14 Mar 2025 19:06:04 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45atnafmc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 19:06:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wftpxe7LhTuw2MwcU+uKYrdzw8lP6h1FXmRGB7Q8OgjUls46Gq0MmCEn+I6h95qhryXG2URngtij7KB5TcZ19eZZxzK9cxVcHMt9reg2zODgI1N5/tQlUzAQa5jGd2LFsMtXUIZKqcV4X72GmAVloWfth3tAdm1UtdXwH2DulZrBxI0lC7zDnYf1FXQcASLrF7lyyNf+Qk6urTvAoCuxdbCgx5v4Wo0lsyYHd+Mc8V2u92p+ujJtRa6QE8qLHJQNAA4aI/W9CJKK9dS115ZPf1FKM/okkjlt/OfDaVqicVm+lJfwVeSq3vxrrbz7tMp2Xv+QKvqlg2QKH5zmfl+tww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oeOXbnYOTwc96AGCua4iIszyJbrn1EYwsnffqUl7Z0=;
 b=i/3mIKKqVW40vKZ/PGC/L5BUjYcfgZD5YKRRlfEzB3vON1dKt3tQHkkDVqLcEMDFaDZRI/Ebo1hK0PRhIADv6dl+H284WmuOl2vEAXw4LXt7Kpfybt7WQOZfCxaKbjpTNqw7chmd89h0S+Og5IAvotyBqYPzsmCEn6EvjBSNVPNeouu55oN5av1cnsXI0GG9atSP/ZMu6AYDdpALuggVyveYF6KAL/pq0KLSkxnClfIEtPThRx1Y9ydSquZEp4cXGJh9n9MCtyoxCoxav1ePvmvjL15ZAY4bxMuSOuEHtkjkm8DnJXFEYm0gQrG4/6kwUIa3smS5xskK4bvMa1kcgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7oeOXbnYOTwc96AGCua4iIszyJbrn1EYwsnffqUl7Z0=;
 b=c+Nb2jAtmnGmHON0G8CAkld01zN0GflSVA4peUKhINfuKspHbOTaeQp4qTl6dy5Dbb5xJ1HLh5q7OvQafb+iGENpleQX7ncb6z0LV4vBfApk52t0tm8jxH5t458BURsZnGZbcaMwx6RnSNxxcrVFA91DUInT2Ot3a0WFfrMfsL8=
Received: from CY8PR10MB6707.namprd10.prod.outlook.com (2603:10b6:930:93::22)
 by IA3PR10MB8514.namprd10.prod.outlook.com (2603:10b6:208:571::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 19:05:56 +0000
Received: from CY8PR10MB6707.namprd10.prod.outlook.com
 ([fe80::ccf3:1df:e15d:7465]) by CY8PR10MB6707.namprd10.prod.outlook.com
 ([fe80::ccf3:1df:e15d:7465%6]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 19:05:55 +0000
Message-ID: <c3095cbc-555e-4f25-93c5-bcee96fc1596@oracle.com>
Date: Fri, 14 Mar 2025 12:05:52 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : Re: LTP rtc01 RTC alarm test fails
From: samasth.norway.ananda@oracle.com
To: Mario Limonciello <mario.limonciello@amd.com>, rafael.j.wysocki@intel.com,
        alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org
References: <dc4c018c-77f0-4cd1-81c8-929f40e6162f@oracle.com>
 <759f4d7e-de8a-4d04-a6b4-e138c02167f9@amd.com>
 <75a1d5d2-8ec7-4496-8c24-2815bb6414e5@oracle.com>
 <b66f43d9-7e98-408b-9123-6689d48a642d@amd.com>
 <19e6873f-3cba-49e7-bc1b-544bffe5eb71@oracle.com>
Content-Language: en-US
In-Reply-To: <19e6873f-3cba-49e7-bc1b-544bffe5eb71@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0P223CA0011.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::32) To CY8PR10MB6707.namprd10.prod.outlook.com
 (2603:10b6:930:93::22)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR10MB6707:EE_|IA3PR10MB8514:EE_
X-MS-Office365-Filtering-Correlation-Id: 798e62b7-f245-4b44-9433-08dd632b3f77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1BwS0ZnR0JabmdoeHkrblMzUVEvVjRyUm9PRDJNYlVpUzVXckZSdnR3NXRt?=
 =?utf-8?B?S1U0VkZaOW9LTVFKQWkybXRkaWMwaFZTK29mZ3M0VEV2dTVlYU1XS0E5V0Vs?=
 =?utf-8?B?YTltVG9zRjlpV1JUYWVSY2oxWC93bDE5QytEdTJ3TEFYc0o2aENOUm9vWEd0?=
 =?utf-8?B?SEtZVDV2VGxTTHBIcHdXVW5MZEhZdUwxbjB4WU1KeEZEYzhnQkZuekk4eElH?=
 =?utf-8?B?SnBNWW1FVW9BMlhLbmx1emw1YTVXNFUzYlArTUNld0Y1Mmd2SkxGTE5qazR5?=
 =?utf-8?B?OEo4MkJDTmR3Wk5qRkthWVd6ck9QSFExOFJFd0MySlBWY0psYTRPSzc1NnBQ?=
 =?utf-8?B?bHNTTmhJZmdJOS84KzF2NDFpWnh6bUdzT1RmQXlwM0ZzdGd3ZHU4TjRFTnF3?=
 =?utf-8?B?T1NYMXl2a2FkWVZrR3hCODRUYmRSUTArSDhSY1Iza05mMDZtbGJXM2Zoajdv?=
 =?utf-8?B?RnJLU3FzZXFHaTNycklybDdPQjNnT1ZTdzA2ZkFpVklhdDlVNXk0aTQ0a0t4?=
 =?utf-8?B?dTMvbkZLS2c4RUU1c3FXaDF1c0RvVnBQTFl4NDh0LzFZZVNTQjhUWm5BN1dw?=
 =?utf-8?B?QmxPT3grVHRaL2VobFJTSlhLci9VRUZKWmRYNS9iTGJOMys0NW5Qb0toTXJo?=
 =?utf-8?B?S1ozcnRzSkhXWW9zMDFxbDBySzFtdjlGb0p6ODR5eDh4dm9ka1Q1Z0t6WGkx?=
 =?utf-8?B?U25ZSkJwbUNybGd0QXpHYXFxZC84cEZ0Z2E5d055Z2o1S2ZPaDZTamhvUWR4?=
 =?utf-8?B?MEhBaE1OS3NuS0ozaUNET2hVWm8yZWpnZzlQZEgwdUxyN2s1Ym5sUmExVEF6?=
 =?utf-8?B?dGxpNTVkZU81dUxWUEkzMzhSWHNMS3htSkxQOEF0N3FqcElxdGtLYVU3cnFL?=
 =?utf-8?B?LzNFRHJOQXdRTE9GNlhHbnFibktrVDIrKzdIZ0tJdGQ5TllzbUFkdVliNGlM?=
 =?utf-8?B?alljbEYzNkwvZlJkeVBUY0JBM1lTdExYc1AxbEF4K3JUUDJyaWt3ZlJTa0JH?=
 =?utf-8?B?dXQ2UlBFa2tjRzVONzJQd2JqY0M2ZE1nblRXVk4ycUhGVFUvdVBDc3JJRTFQ?=
 =?utf-8?B?Nyt3dFlUWkovUDFVZFdWQ3l6NUNoSEFtUnJhaVp6M1VWNDBKSnQ4WVNxdVVL?=
 =?utf-8?B?YVl3dFhRWFI5K2UzRkh0aDRaeGxkR0hjM1g3VnRNa1dWbTlCN21yQWpqejVY?=
 =?utf-8?B?M1RkbnJKcER1MTRqcUh0WjlPaXdHc3lIZEMzSW5OYmVLTU5FeE0xekVSZ3ZD?=
 =?utf-8?B?Ym9JclhYRkFKeks5Qi9GcWxTRncyNmN3OVNPTEIzUnRvQzFCT3FQRzFmSEZX?=
 =?utf-8?B?djJod2VudUp1NEROZC9XWWN5Q1ZyYWhqTHhTSDhFZ3ZYditkdGR3V016RU8r?=
 =?utf-8?B?TGNUSjVoOTFTZVpvN2pTRTQ4Y3cyOE1wNWJBbjhKbDVpWnR1MWhMRXhsTHcw?=
 =?utf-8?B?M0FHUUpkUXlwalRkKyt0eWRtTlFiQlpuMXJlMVJtOWt4ZzUwZ3NZSjh4Z1Zk?=
 =?utf-8?B?QnpaVHdCZ2NEZmhzYnduM0JWSDZSM3JQejN1MmY5OWtBQngxMmpVNmZvbXRx?=
 =?utf-8?B?bU03OU4rN0RkeEljUE9UK3QxSGJaMjEreFZVVzI4M1ZFWjRDNVdWQnVRMlZN?=
 =?utf-8?B?Q3d0Q2tpQlRPekFaWXF5WklPWk9GNUNTd0JZbHZVNEFvbnZyNE9halorL29r?=
 =?utf-8?B?MENaZ1RXTThDMkRIbVJZYU1lRWFhSmdSVXN1SGMvS3lUM1ljcXBsNmY4c3o3?=
 =?utf-8?B?VG4zQ1RiYmc5bEVIKzNqU2VHUG5VL3FSRWJXc2FuVTlnWEhiWFRpSUxmdHA2?=
 =?utf-8?B?MFhCUTlkQlNYWVFEMzcxUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR10MB6707.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NytWUEt0QnU2OFcxUldReXBJYmQxNktlSFdqR0pzTVRsV1JWTlhQWkhxOFNL?=
 =?utf-8?B?bDBxZmZUTGNZRm1qM1l3QnlFOW5xVVpUb0tUVS9YZ1pZTHg5OUxGMG9Ibzc1?=
 =?utf-8?B?b3o0Z1BxNzNnRk5nVWZJSktMQ05PcnN4Yzh2NUxnc0JmeWUvQ28rdndQNFQw?=
 =?utf-8?B?QklKbzhXNElqVjg0TG9pNGZGQlJ4NHFyK1ZScUwxQ3ZqTlFmUy9EMHBZTDBO?=
 =?utf-8?B?eS9uN0JQRXdjOG9mVXVCRjdDdnZPTDYzbEZVUlBrMlQyclZLb2NxUndzMW5Z?=
 =?utf-8?B?MURJdU1TVDBzTGh5WEV2aXBYSThhd3dYOXNTWm9qME5DcTFOcUM0MjdkK3lS?=
 =?utf-8?B?aXJzcDAydHN0ajNUaTBZdG5rKzhDb1hMNW1uUFZIcG9PZ3hVZVRlSVNNdXVu?=
 =?utf-8?B?a1VhQjB2czV5WG1uY0NPaUZOL1FGZG5yd3NibkpHT3dxaHR3OE9YVytYYWJZ?=
 =?utf-8?B?UmhJcU5sdVJWT1QxU0h5L0pKV3hmaUtDN2VkNElabzNZenpvbmZXZGJpVkQ5?=
 =?utf-8?B?NTdaR2FlMVdNT0FNMWM0cGNrOHNzZGxXc3R6cWZsd2NWM0dFeExYK2YwWCtF?=
 =?utf-8?B?U1p4QmxxQTVDalEzek4xWmdBU2lNcG50UEtUZkJJekR5UTVwY0Nac3QyNWsy?=
 =?utf-8?B?WEY1V2xERzRqWnRRcXFiK0RZRU9ROGZ2NFB6ZkRjbUk0ekd5dlE0bDFHMjNz?=
 =?utf-8?B?aG84RUtJOWFrZUdxenNPdWd5bExEczVkcjI5b2lqSzArcEw5MjZpd2hBcncz?=
 =?utf-8?B?d1Arb0swYjJ4bldYNy9jVEVqNnAyUHo3UFZJQUV3cWFuaVI5aTVRWmdpWkhX?=
 =?utf-8?B?dmhwdThyNkMzajVVK1d0SlpGck02ZXdNVDRXOG9EMzl2aUkvazBhb3JwMGh4?=
 =?utf-8?B?R1BndUdsT2xVTEhkbHRyc1JyY091WTZKU0J5QmhTVWdtNTU1VUxYTXFtWExZ?=
 =?utf-8?B?SUtJUVVEUXQ2cUNFOGdYMEc5MnAwYlc0cEtOcWZ3MGlobE0rWFJkYTlMbXgw?=
 =?utf-8?B?dTlNWERCWW1EMS9oOTE0dlhCQWtVd0RZelhRZTdwT0lESDNIOXdqazUyUllR?=
 =?utf-8?B?WGRvZDBka0cwcllDcnVxMEFXQjIzS2hSYllKcEpaVUJQYlYydzAyS2FWcmZJ?=
 =?utf-8?B?c0h1czFmU2JJL094RWcwREJORnhtOWoxODJmWnl1RmlFZ2JVb0FzZTRRWmRB?=
 =?utf-8?B?OWFVT3VMUHBjbkJta2o0aHVlMEJuaGZZS3lDdlpYRTF0eXNxd0xmM3BYUXBT?=
 =?utf-8?B?TXZ0c29MQlYxdXFLSXNmRVNHZVFDSEUzVWlxUmwwNkhGZm1ObFFuR2lwMmI3?=
 =?utf-8?B?RlJkU1dQK2xyZVhEbUd6UXJCeXBlWWg3OFE5T2JkQmp2bTN1TXhvMDE2OGdi?=
 =?utf-8?B?Q2JEelc2dXI3elRaMlhZYkdmK21LZWZaMm1OSFFRV2p2RWltSWJ2ekVDamJP?=
 =?utf-8?B?cENHRENCOFhPQk1iTW9tYTJGTjJ2bFJ0VTRnbEF2OWNUcWRMSWJJYys5bElY?=
 =?utf-8?B?V011MlhRWDdDRGk2MTg1cTY3ZnlZaDlTbVJXQWVJbC9tWlNpbmlCamlHTlpl?=
 =?utf-8?B?YkplTndieUplQXNYTU15Rkp2RzJSOXV2QVk5NjJqUDdaaUpVeVNabEh5RTF6?=
 =?utf-8?B?QmJKdnBCcnZ5bjQrZml1K21odWpTZCtteGFNNy9rSU9zZHo5eDNrNHZLbTBi?=
 =?utf-8?B?bXRmVmEyVjJvYkFBakUwNFhkbkQwUVFCcGZCWklIUVFQeW14KzFNc245ZDNz?=
 =?utf-8?B?cHNVZDVkM090TWZyYzNJbW4zNGdoZExLelB4VkVqNkVLNnpvajlJSGxnL3Q5?=
 =?utf-8?B?RU1VVmxGRlBUOGdTYWY1a0NFcExCZkhSK2dNQkRCSnlMdlZjK3ZtV3VpRmlY?=
 =?utf-8?B?alVpOWxIbDN4cEJKcUpTbEh0eXZ1VnE4VWM0dTg0TTRIRGJjOWd1dDdJS1Rs?=
 =?utf-8?B?QU5aMmZkRml0eVdub2ZjWmZHeFdXaEFEMGxxbEc5SXlJaWZMclIydzV2TFRO?=
 =?utf-8?B?MDhtU3h4c2w0ekMwNlRhYzlGL1U3UElYeTR1UStLZE1QRkg3WEdDelVGOFAr?=
 =?utf-8?B?OFlpUk93ZW9lNGQ3LzZYVmJuU1hOSGJ1ZjJSalRJUzY1em5wamdOWlVHR2ta?=
 =?utf-8?B?NDZmTkNmcG5FbGdyWnFzUzVSMHRDQkhlZlZTYk03SWdmaURnVUZiYms0OHhj?=
 =?utf-8?Q?UsrIr8gNDTky0z/OJ0JHqeU=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EuNEHTcjNt0K019UFKLVv0cM3QCRFexIfrvtODQiZJR0xZyGsXEWN3es3LJcou03gdS3+pMH9W50Hnl7brVxESQrq+xk3Pk8CcQgAcYKd0ghvX/oZWBqG1RQCcv0nOyM4zm2WainnsWJDjD4BwMDpHQMn9d3c48EDgFwm9k82GzS0/9kuY1gYY9ux96WzycttrshT/dEVwKEYMA3Y5ajST7a27x8AVvtwxahYphRIsPG+lGbuLczk4QejKmBAgv20o/tuRZMOdIz6kY3KDHsD3aDL8W1ok2kq9CrHFD1oQr6KlUu9k5KDpKMXskBthrlONPNca/spg44EZ4PEvczw5gFzO4je60WzensGZwY9zbiAyKM8Mxc3q9j7INrZ0ccmTSaew5WigPtXZ1sQB3EKz1mFrCakqMDEscTF4KybFkdMMhiSQnjx/nJekA5FrF8WhfwGoJMEG0atQgUgghEheXJ9rqMx1f/EnXMeegYFwelvb5hy8DZsAQBeoieo/aTj/T4ZHyqrF9COVQlar1IWlsZONlfL4SBQm2pwqIFwfIml9WVvZE6FSqbhHCgCCsqowkzJVrPLMT8qdZ6RjcDrMmD6EVrmweLDgaqWR8L9+o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 798e62b7-f245-4b44-9433-08dd632b3f77
X-MS-Exchange-CrossTenant-AuthSource: CY8PR10MB6707.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 19:05:55.8448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvDQU/1VAkpfPMYc2j/moeiZdZioRrZxIO/92QDXcn0sAlvyj8R6pcw3Kvk0OqVL307KtnKorksSeYwic7n1yJe2GG/Fa+m3hbE2yoXGB+8Nsd/P8UvnJoxVaaVYveIk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8514
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_07,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 adultscore=0 spamscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2503140149
X-Proofpoint-GUID: 4Aj8O1gBuD6wDK5OFF-y8dN3fHIKcbC2
X-Proofpoint-ORIG-GUID: 4Aj8O1gBuD6wDK5OFF-y8dN3fHIKcbC2



On 3/6/25 4:17 PM, samasth.norway.ananda@oracle.com wrote:
> 
> 
> On 3/5/25 6:59 AM, Mario Limonciello wrote:
>> On 3/4/2025 23:24, samasth.norway.ananda@oracle.com wrote:
>>>
>>>
>>> On 3/4/25 7:00 AM, Mario Limonciello wrote:
>>>> On 3/3/2025 17:48, samasth.norway.ananda@oracle.com wrote:
>>>>> Hi,
>>>>>
>>>>>
>>>>> We recently observed that the LTP rtc01 RTC alarm test fails on 
>>>>> intel based VM's. This seems to be observed after the commit
>>>>> 6492fed7d8c95f53b0b804ef541324d924d95d41 - ("rtc: rtc-cmos: Do not 
>>>>> check ACPI_FADT_LOW_POWER_S0")
>>>>>
>>>>> I noticed that the use_acpi_alarm was set to "N" before the commit, 
>>>>> now it is set as "Y"
>>>>>
>>>>> # cat /sys/module/rtc_cmos/parameters/use_acpi_alarm
>>>>> Y
>>>>>
>>>>> #./runltp -d /tmpdir  -s rtc01
>>>>>
>>>>> <<<test_output>>>
>>>>> incrementing stop
>>>>> rtc01       0  TINFO  :  RTC READ TEST:
>>>>> rtc01       1  TPASS  :  RTC READ TEST Passed
>>>>> rtc01       0  TINFO  :  Current RTC date/time is 3-3-2025, 21:02:20.
>>>>> rtc01       0  TINFO  :  RTC ALARM TEST :
>>>>> rtc01       0  TINFO  :  Alarm time set to 21:02:25.
>>>>> rtc01       0  TINFO  :  Waiting 5 seconds for the alarm...
>>>>> rtc01       2  TFAIL  :  rtc01.c:151: Timed out waiting for the alarm
>>>>> rtc01       0  TINFO  :  RTC UPDATE INTERRUPTS TEST :
>>>>> rtc01       0  TINFO  :  Waiting for  5 update interrupts...
>>>>> rtc01       3  TFAIL  :  rtc01.c:208: Timed out waiting for the 
>>>>> update interrupt
>>>>> rtc01       0  TINFO  :  RTC Tests Done!
>>>>>
>>>>>
>>>>> I believe that the hypervisor may not fully support ACPI or may 
>>>>> implement it differently than physical hardware. ACPI wake-up 
>>>>> events may not be properly supported or may be emulated differently 
>>>>> in the VM, causing alarms to not trigger correctly or time out.
>>>>>
>>>>> On AMD all instances the use_acpi_alarm is set to "N" so no issue 
>>>>> seen.
>>>>> On intel Bare metal instances the use_acpi_alarm is set to "Y" but 
>>>>> no issue seen.
>>>>> But, on intel VM's the use_acpi_alarm is set to "Y" and the issue 
>>>>> is seen.
>>>>>
>>>>> I even check with
>>>>> # acpidump > acpidump.txt
>>>>> # grep "FADT" acpidump.txt
>>>>>
>>>>> no output from above saying that ACPI_FADT_LOW_POWER_S0 is not set.
>>>>>
>>>>> Is it possible to know we can address this issue? Should we make 
>>>>> changes in the LTP test itself? or in the kernel?
>>>>
>>>> I'm a bit surprised it didn't also affect AMD; but maybe that's 
>>>> because of the specific date of the "BIOS" for the VM.
>>>>
>>>> To me this sounds like a hypervisor bug though.  Could you add a 
>>>> condition to detect this hypervisor and exclude it (and also report 
>>>> it to the vendor for the hypervisor "BIOS")?
>>>
>>> It's not affecting AMD because of the first check as below in the 
>>> use_acpi_alarm_quirks() function.
>>>
>>> if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
>>>      return;
>>>
>>> In AMD systems we return control right here and the use_acpi_alarm is 
>>> never set to true. But for intel the above condition wont pass.
>>>
>>
>> What kernel are you working from?
>> Take a look at 6.14-rc5 and I see the AMD ones should apply as well.
> 
> Apologies. I should have mentioned earlier. I was using 5.15 kernel 
> which doesn't seem to have the commit
> 3d762e21d56370 - ("rtc: cmos: Use ACPI alarm for non-Intel x86 systems 
> too")
> 
> On the latest 6.14-rc5 I see the issue on both Intel and AMD instances.
> Both of them have use_acpi_alarm set to "Y"
> 
>>
>> https://urldefense.com/v3/__https://github.com/torvalds/linux/blob/ 
>> v6.14-rc5/drivers/rtc/rtc-cmos.c*L813__;Iw!!ACWV5N9M2RV99hQ! 
>> MSCvhczv2vkH0AFfUN6OgIpOEISmEW9BVob2fU7MLnPVbY6- 
>> v3bgHGVojTh0KyfAoZzOUY1_AHlggpu1JtmiI2u7WQQP_UQDZg$
>>> I added a check to find the hypervisor
>>>
>>> cpuid(1, &eax, &ebx, &ecx, &edx);
>>>
>>> if (ebx == 0x756e6547 && ecx == 0x6c65746e && edx == 0x49656e69)
>>>      hypervisor_name = "KVM";
>>>
>>> I was able to detect the Hypervisor to be KVM. Do you think that the 
>>> issue is due to KVM?
>>>
>>> Thanks,
>>> Samasth.
>>>
>>>
>>
>> What BIOS image is loaded by KVM?  I'd say it's more likely an issue 
>> with that BIOS image.
> 
> I see this in dmesg so think it's using UEFI.
> 
> [    0.000000] efi: EFI v2.7 by EDK II
> 
> Also this folder exists -
> # ls /sys/firmware/efi
> config_table  efivars  fw_platform_size  fw_vendor  mok-variables 
> runtime  runtime-map  systab

Hi Mario, In this scenario should having use_acpi_alarm=Y on VM's
work fine? Is there any way to handle this other than having a condition 
to set use_acpi_alarm=N while running on hypervisor?

Thanks,
Samasth.

> 


