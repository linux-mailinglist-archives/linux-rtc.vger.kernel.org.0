Return-Path: <linux-rtc+bounces-5834-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vikAKPomcmmadwAAu9opvQ
	(envelope-from <linux-rtc+bounces-5834-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 14:32:42 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C9C67519
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 14:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1E8976CC5D9
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 12:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2433921DD;
	Thu, 22 Jan 2026 12:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Kj3s1kj3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011010.outbound.protection.outlook.com [40.107.208.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054B831AF2C;
	Thu, 22 Jan 2026 12:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769085519; cv=fail; b=KFAaPqD78mKr/RFr+EhJna/3T9vKDFQTKEyqLN3lmQmCc5kBindnpYDprMei6g1BXXPDJ03BANhZwXZtpXBJs/1abvqZMCpD7c555sQCDewpjobUcnTKFCxaauxKZ7uXuiwXkzZOIHTGaRcjXfhp1egiQoySqzV3wXvJ0jBkK+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769085519; c=relaxed/simple;
	bh=V/RRF13i4VVVq9cSuKjKRTYcA6OVYzfIfYh7K4Qbd5U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pM5ivm4l7AfakU+E3kugy7KdAKtDbl6va7TY4JWgTye7MkfacMNRfDJJ5r8c3UJ2A2bp89EC0Z6GJO/UP8Guk0UWEOrOR1RlOyyir0vuZkLrHFu0kDhKBgp0lwfdOxrYeuK/ceSJIaNtnhoBCwiw4fwh+ieuMuYkzP3RqJgFUH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Kj3s1kj3; arc=fail smtp.client-ip=40.107.208.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8QQrdxCT/c95+wRZnVHNbdNkqph4Upv9cxb1Ct0bfgCde/KBoRq1CeQ2jiHci7F+Fgo+FY1SnLDFODPcEFfr2ShBsfqtC7szidWCToyul5nPOj/jrTrQIIAf7vHl0VHRhnlHU+fvE2ZVOA/UB7zHB94EGXAzg4rTyAxrWKfLRmGhh45YKBKj11GcTr7jqk/S3G1G6ztRtrTthgZ8vomK4lFGUXeWYmjg6qAnd8Sm1K7pABDjDvld46qDc2srWvCNNWwGmFj7duKxoBASzKLoKMDHMmbWzgelAB07T2KnE/Eu750vDof983HmrjU8N+sNuHvkIjNVLFzaw1C8BHlxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9YMRkLhjKzuOG/C+j68fqKqVEKNJ+2KTOT1E1MmrFI=;
 b=oJN5DXR2JLiukWL2X0+2r/4kzq+0G6WB5JCyxDl397Jhrzz8Ql5wcJkAPwbjpaXSfsvMRWTZADz4JXpqSNwqHXninH2/+IguSABsLI+fs4eQbxDKJ/opWPwEY9Xpv7LAh8/jghHpt6CYVelVhCtstGccm5179mhfJm7feOLR7VmKYzjI6mkZz5mdLbKG93p5xoj0WLtjGO8WQ2dZcGxkrsT3MsbKHeRfU3ygUFxjBRH9zRMqVVVvLJC0DFbCsuwqtH7TndYYa4EI6hDEcSXQFEfirYc3Qn0+PuPTltItD6SibFjJ6QoREn84kYUAEzbyazvhr+L0VDAbY/vIaWNSJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9YMRkLhjKzuOG/C+j68fqKqVEKNJ+2KTOT1E1MmrFI=;
 b=Kj3s1kj34UvDnInX8eF0hyI0Wc97RUjxZxPd7PVft/V3bwa4uMykRCDQeK/gmt0k+FseaxqocRozOr3HGDnfmpWFAyyB7ss1iWf7SP+2bdOi+sd1ns/w5bDw06lHz6QHVHXRs+XKZFa98HxmXfecsQ9oxg6q0s1A7GsKANqp4uk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by CH1PR12MB9694.namprd12.prod.outlook.com (2603:10b6:610:2af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 12:38:35 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 12:38:34 +0000
Message-ID: <7786b3e3-15bd-44ee-be05-3ee5aa52743e@amd.com>
Date: Thu, 22 Jan 2026 13:38:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] rtc: zynqmp: declare dependency on arch
To: Tomas Melin <tomas.melin@vaisala.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260119-zynqmp-rtc-updates-v3-0-acd902fdeab1@vaisala.com>
 <20260119-zynqmp-rtc-updates-v3-1-acd902fdeab1@vaisala.com>
 <a373e247-3936-4c16-993b-ca8fb732fb18@amd.com>
 <d63d7f6f-0ff3-4f2d-8326-96b29d7fe57c@vaisala.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <d63d7f6f-0ff3-4f2d-8326-96b29d7fe57c@vaisala.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0502CA0006.eurprd05.prod.outlook.com
 (2603:10a6:803:1::19) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|CH1PR12MB9694:EE_
X-MS-Office365-Filtering-Correlation-Id: 305a3ac6-2d75-48fc-ab53-08de59b3280f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VG5VSCs4dDFYeXJ4MEpnN3NIWSt6VVpnRkNPWTc4b2pVbmgwTmNQb1JqbzR0?=
 =?utf-8?B?NFVLOE9BUUVyd3NwVnR4Kzl1Qk4zRnprWUgvMzF4dEtJTWJRaksrZUp1RVNr?=
 =?utf-8?B?dklNQ2pXOHF6YkxGdVJyRUxKRGQ5WmxsS3Y2K2FUeTNpL0c3VU1odVpIQzN2?=
 =?utf-8?B?cTlFZHpoSzRRZkQxZkJxUEVZK1RJd242VUc4QWNOZkJoRm51ek5aR2lpU0RU?=
 =?utf-8?B?ZUJxYWVuVVVnbGo5ZVRNUTI0dUxWUkpGZ1dWL0ZPUzlDYTREb3dDeGNlUmhv?=
 =?utf-8?B?eTFCaTlIdjdGTWUwNldVVWxTOEg3TURNWldNU0JMUW1QRkNPNWczSWxidmJ4?=
 =?utf-8?B?YlpFOEVXa3R0dU1QaE1iWlpWeDlqVkg2L1IzN1RUUG5RYXJuQm1xSUVRNURR?=
 =?utf-8?B?Q1EyYVVtWDQ4ZGg1azB2d01KeHZLcW52QldnQ01iQmJJWWJqaVRRWjJ1NHhs?=
 =?utf-8?B?NVEwZzFmdWQySm9hRzdUNmFTSkk0QU52K2lkWEoxRkg2YWdKYlB2NEdBQVlU?=
 =?utf-8?B?ZHA2dTdEWkFaYUhiaFlXUlNlY2t3SXYvS0xtbjJ1a2pOaTRCblJHYUlBSVh6?=
 =?utf-8?B?VWpkemtnNFlOV0NIOXQ3Q3pkZGg2SXdrV281YmVZeitTeTF0VlF5bUVuYWhU?=
 =?utf-8?B?V3A4UzZkd2E5ZHFNOXAraC9HOWkrTEs2L2ZvRXdWV2R2bWVLejYrL2tNYkRP?=
 =?utf-8?B?UkwwY1BtTlBxOHVpSHpaY0QyY281Y3FNbXJXVXFVakJhR2dNRW1JSy9oWmpx?=
 =?utf-8?B?WU1aZ3JmNTdYbDZmMHEvZyttTzJNUHlabnhOMEk1V013RnhtdWZUdFJqTk15?=
 =?utf-8?B?RG5PTXV5M3hKeXlkTVBYTWtYQjZLRkFNQWdmUUY2TkkvUnp4T1MyR0dzV0NJ?=
 =?utf-8?B?RDdJUEtVT0UvaTVpTldiN3J5T25haUVkR1FnZFRkZlpoU1lUbjNlajIvK1M5?=
 =?utf-8?B?ejA5c0wybmlsT0V4Z3kwVTZJR1kvR2RXNTVnMWxhU040TDNISWUyTGVPVXZS?=
 =?utf-8?B?dGpFUjVJWFlZVjJVUUpMTjgzVldRK2tSbkVMYXZ6aEcySEtPUDRVT0pYVjVX?=
 =?utf-8?B?eHlnYXZCVldQQUk2WFdkVFBzMzU3VFdqZC9ybCtBTE5ldnA3Z0xHQmM5L01P?=
 =?utf-8?B?STVUVGpCU0N5OUEwTFYzUEZRV2VRQTMzMEZGRHprM0hiR1FxRGN2WFhuVXI0?=
 =?utf-8?B?dmtKOFdIbjFhQjZaSjljcXlGOVp2aG5NWHZGNFBZZXhYK0NQLzdKTkxVem9y?=
 =?utf-8?B?TzZXU3ZqZ2cvdis5aHZPNG5qOG11Q1BkQ0oxK21oVXdFVXVkQUxveE5hcFEw?=
 =?utf-8?B?QXJRM0N5THdONFMzc1VXaGFBRDNCN211NWlDczR6dVh4d3dmS21FMHVYWVNW?=
 =?utf-8?B?Q1Roc3VUcWNkcTk1R1A2S0xVc3pVTVpxeUhrTDBCZkt1cStFd0V1dnF6RWpi?=
 =?utf-8?B?RllHOWlZNUNhNVdyWXJBYU92SnBsVFVSN0RXcUZlbnhqcmxkRGJGSHZMRGcv?=
 =?utf-8?B?dm1YTy9UNE9jN2lwNXVleGlTNjFzOE41VHY4ZmNVdU1lbGNYSU1mbHRKdDAx?=
 =?utf-8?B?SHZVcXhJdVZMSCttL2NKbGtZRGdBMHkrV3NxM3B0YVhYRmNDbjg1elZmZjBU?=
 =?utf-8?B?a1MybjF3Q25MUmQrVVFPVlNEL1h5RVBLSVUxMzBsemRsTkRBclcxNWhIOGpp?=
 =?utf-8?B?SEpKbkFZZ1NHZ29IVC84T1lkNWtLc3JDUUltMFhBL2g1S21GTmV2UDVTQXZo?=
 =?utf-8?B?dS9BUzFLODRMNU5RNXVCWlN2emxWRGF5THlwR09oTVZhUjlKOFpuM3hIK0Ir?=
 =?utf-8?B?R0YwVWp6bExadk9nWlY2NG9EZDBZTkc0M3ZleURnWEM1by9rZkdGb0ZqTkNp?=
 =?utf-8?B?VkpvSEkrZ1FmZlg2ekhWN1VHZUNPdTRZWFlHUDI3Q3VyakxFMnlYU2dyUnZW?=
 =?utf-8?B?NTZHRFBtbUlDdWQxL0QwYXJwaEpmWDM2bDEwYjY1bkFFcm93T0R2M0VwRmlp?=
 =?utf-8?B?ZWI4NGVHcFhRd3J0NDl4REpoajJlTGxLcVVLUlg4cGNNa0dqdkwrRHpZWWNo?=
 =?utf-8?B?aDRhT3UrZDZ6eWllblNONkhjNVEyS2VtMmxoV3FuTzhLTDE4RHVvREhjT2tz?=
 =?utf-8?Q?nLSk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDhIMkJBMEwra2RITHBaeDdaVGFVWVRDcjBnRk5oMW54V1NvTWFqcDYxUHJm?=
 =?utf-8?B?SFNpZWY4MkRUa0xIc3NYV2dIcnR6NmRaT3ZKYjhzNUcrbE4xdXJXMDhzOVdD?=
 =?utf-8?B?ZDlGVlV0bTRaTlp2Tk03VVVLeGc4THVkVS9pa1hBVTJXOXhTSVZiTHdjQ09a?=
 =?utf-8?B?RmhiRHhram9MM1Fhc05Ybmluc1RoWEluS1JhZUt3bnNZMFczZzdNU2Z0NHFZ?=
 =?utf-8?B?SUNEQk1lQXdnZmMyMDlNTDZ3RlhGUCttK01lN0dvcE52c1hpbDRDdEtoYlM5?=
 =?utf-8?B?YUFob3dtRnFMVGpxYnRqQi9JMHNGN0hnQWVaRklwekUrSzNSTkhQcWJ4N3dr?=
 =?utf-8?B?cmNSYWNGejBRK1NXSStlamxIOFdWSVNBeFR1TUFlZkczUVJNWkNDSkM2Vy95?=
 =?utf-8?B?NGxQcjFKQ2Z5Zk10ZTdkUHFRRmNIdHkrSHRWMVdFQVZuN0xybDZPOWExcy9G?=
 =?utf-8?B?NU5JL2pLUGE0WkprbGVURTdHc1BtUmRsbFJTZFE0NTY0WFhWY0ZtMXBha2FG?=
 =?utf-8?B?dUZRTG10RjlxNVRWUXJDM25ub1JNaDJBYjBoTmVqVjUzdi9KY3Q5Nko1Ukc2?=
 =?utf-8?B?NlM3ajZWcVFhZjRqQ3AwcFBLK3NJY3JHcGdEN3FqTTl4SDNyY0lRT3lNR05I?=
 =?utf-8?B?VjM4c2wxYWdFdnJYNkNMSEhrV1VQR1UxR3BOdW9WZ05tUGVJK2hZcnhiRFR6?=
 =?utf-8?B?aFdaZDRDb3diZkRYT1lVY2kydUZYQ2pGMlJOTk5Hd0dCMXBIR0xjZjVQQS9W?=
 =?utf-8?B?T3BENWZwV1VlVDlya3I5eTZlVXZFYU9DZitSOHY1Vm8zQSttdTVnVlRMVGR5?=
 =?utf-8?B?R05ldUtLSndUWXVOMW9GZENjSVFQdGtLeDgrMEFNNnE3ZVdGdGhzdDFka2xJ?=
 =?utf-8?B?akw0VG4rZ0RubmJFOUlnV3E4OW5FV2lzNlFPQVdycy9nQUl5OTNXOEtFdmVo?=
 =?utf-8?B?YzIrcmlFUGthZG1nclRlN1Z4aUQzR0diSmpvRzZ0MUc5WFhPcVhHajVPMlk2?=
 =?utf-8?B?Ym1IeVR6bEdBVG1BemQ0U2EvWU5pRFpVeVpEYjkvV0F6VEtkZkdEOEIxSWc3?=
 =?utf-8?B?dXduU0tpQnI1VlAwcE1tWklxZTRnTDRESmtaSU1DTGpscXRZemJNWEJjUUJp?=
 =?utf-8?B?aDFxNU9nZkFCQXBYdksvMlJwb3c0cFNvelh5cG1ydEJwVzgxTllBZDdMaHpU?=
 =?utf-8?B?d3RXZzNva1BBSFBXYzNQcFhwTHZoRkRWQUs1ZHNFdVM4V1FHaENOZHMwK2tK?=
 =?utf-8?B?OGsrY3kxeFhMQVZ0NGtMdVpiTjZUZi9uNVdsZkpFZ1daRUF2dG9hb1BycWVH?=
 =?utf-8?B?ZjU5clhXRUVUWDNKcnF5Q254SG1nVG04K2JGNEU5TzNMeng1TGRXYmNZZ0Jh?=
 =?utf-8?B?aWorclVka1MyOC9HREMrT1dvTXJKeXdPT3NUdUxsTHBvOXlTYjFrV3ZwcGZE?=
 =?utf-8?B?enI3SVlDSkRUdXN2MFVhQi8xb05lcDhaSUFGcU9sdk9iRTlIaWdoRGdQUEx6?=
 =?utf-8?B?eGpCbEM2UUxLeDJvRlRlY3FUN3hPZ2JPS1AwLzNFNFgrYzh6RzdPcTBCempu?=
 =?utf-8?B?bk1Jc2FFMExoSFhZVUtsN1NhY0hiUkpXU01BVWRud29xQXhudDhYU0pma1Rp?=
 =?utf-8?B?TXBZdDdmR0xFSUxjR2JGUnNFMzR5dHlMbDI3RlBBcXpKaTI1c2gvYnVUM3Fk?=
 =?utf-8?B?MEdwODB2NkpqWFE5NHdYa2dJQmhBOXZHVDUwbFBRbGl4cTRYWFh3ZENqajhv?=
 =?utf-8?B?dVpKZW81MEJxVklmL0FFSEJjNVg2NmRDWnJwVmpRWGI3Y05QbFR4bzgwNW14?=
 =?utf-8?B?UUtrTTJmN0pqNkpxQ204bFY4ci9TRStYRlhJbDBHbXcyYnRYN1RRZEgzMUw3?=
 =?utf-8?B?TTYraEhJZTBzdzIxcTh4UVkxSVR4emQzdFUwMERNVkZlRUxNbDZEZzlaZEw2?=
 =?utf-8?B?MUlGQXEvOUNsZkJ6cFRJMFBFa2tXQnlmZ0pSMWNRZHQ2NXBrQllsWnQ0Umxn?=
 =?utf-8?B?NE1CcXpXY3E3SitxRjJMKy9wdURQYnBRZUtOQVZ5WDU2Z3d2RUtXOVQvN2FP?=
 =?utf-8?B?ODNOWUd5WStoZzg5OHVQcVc2YW42RUdRRG1DU3NxY0pmT00vUHhJeXpHdnlD?=
 =?utf-8?B?NUwxbkcrallOMVlkYkV5TW5lOHZidk9kT0RDMlNKQmVHdktUc0taZk9YVXdw?=
 =?utf-8?B?bHY0ZmxNZGJjRVFwMVAxdzdubDQvcHB4c1ZnbmxndVhjbnc4ODFPUlNCRHNj?=
 =?utf-8?B?dkpnNnBQTk9BZFJZOFV6UjI1YXRxL0UxK0VBUmsxOUErTmhyMkp6SjZoS2F0?=
 =?utf-8?B?cXBuQXFMYm5kcHIrelc2VkRBZkIwdXV3NlRiTWR6ZjNYSFFyaEFVdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 305a3ac6-2d75-48fc-ab53-08de59b3280f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 12:38:34.0282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dd1pfnngYb4ag6RCe/uVdTYbRkDFUZOlCsoNXzjimue5doJM1AOXr7PBIEN26VXb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9694
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DMARC_POLICY_ALLOW(0.00)[amd.com,quarantine];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[michal.simek@amd.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-5834-lists,linux-rtc=lfdr.de];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 48C9C67519
X-Rspamd-Action: no action



On 1/22/26 13:25, Tomas Melin wrote:
> Hi,
> 
> On 21/01/2026 14:16, Michal Simek wrote:
>>
>>
>> On 1/19/26 10:51, Tomas Melin wrote:
>>> Driver is compatible with RTC controller found on zynqmp.
>>> Configure dependency to enable building only when zynqmp architecture
>>> is enabled.
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
>>> ---
>>>    drivers/rtc/Kconfig | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>>> index 2933c41c77c88e60df721fe65b9c8afb995ae51e..46b497524cbfb5d0c1662dcaddbb6d28b4ae2abe 100644
>>> --- a/drivers/rtc/Kconfig
>>> +++ b/drivers/rtc/Kconfig
>>> @@ -1376,7 +1376,7 @@ config RTC_DRV_OPTEE
>>>    
>>>    config RTC_DRV_ZYNQMP
>>>    	tristate "Xilinx Zynq Ultrascale+ MPSoC RTC"
>>> -	depends on OF && HAS_IOMEM
>>> +	depends on OF && HAS_IOMEM && ARCH_ZYNQMP
>>
>>
>>      arm-linux-gnueabi-ld: drivers/rtc/rtc-zynqmp.o: in function
>> `xlnx_rtc_read_offset':
>>   >> rtc-zynqmp.c:(.text.xlnx_rtc_read_offset+0xd0): undefined reference to
>> `__aeabi_ldivmod'
>>
>> You should use macros like div_u64() to fix it instead of have driver enabled
>> only for ZynqMP.
> I can do it that way if you prefer such approach.

Definitely because this driver could be called from different architectures. 
RISC-V or x86.

Thanks,
Michal

