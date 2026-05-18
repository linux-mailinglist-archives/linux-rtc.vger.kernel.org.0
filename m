Return-Path: <linux-rtc+bounces-6545-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHiaCBhNC2rhFQUAu9opvQ
	(envelope-from <linux-rtc+bounces-6545-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2026 19:32:08 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 79842571A4B
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2026 19:32:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57E70303A903
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2026 17:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801713890EB;
	Mon, 18 May 2026 17:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2IXOxpQM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010052.outbound.protection.outlook.com [52.101.61.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA6B21E091;
	Mon, 18 May 2026 17:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779125461; cv=fail; b=IVAuLeZKWmPxvdSgRj2ZkqiEbfcdTumo5ASirgSfVCg+nUfZooQ2uTMwr0+II7wFEAkT6TuRHRAkW9mkSbEuXs9moGZ1uoMsoxjD+jOBHETn83zhLugW5/NhoxVfYPoyRgnXGpT/VJ6ZPFop6sFzQ5SRuI4UT2W6WPJ7Jr2iNXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779125461; c=relaxed/simple;
	bh=QQPQHHjZ1w8Bt4OVAHL+TeNv630/dt8VOyiEvf7xy2E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o09WJdMDfq6nwJCmzFoquEtrmbPww8yBntnytpcSzHSEDIM6Zf0yMvgLYCdy4EzHWJJalAQ6HwQtytcaL2+gV1NNmxxd++CrIde8i7DIcsMXFZV+/uFbLjXrT5cdJIFzyA437+Ypwd7SCPDY+4oT0dvAAf+m8MAWXzJVSDZxOjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2IXOxpQM; arc=fail smtp.client-ip=52.101.61.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdxH0T2AyoNodr3afRW3IRcv1KB8F4d0xgQWvUPgMRvUjWNYwgVO2j5ybmRFY02UcYRyBGgvMMh63xUoAwJfEYWLZivHG5KSe5fnVqRE8Hyr1Zz+DdRzhtdWMi/FcroSkUFcjDXCe5O/MGeBvYyDqhKHo2kynN5Zjp0GC9Wm1Yjzoc10gu1nuhYC/VTjo4k48oyE2VvPfPxsOv1h5W/1rRV+JwK/ONCKTYAUzWPynFyz9XjcUIDp+7xqHQ0NgU8FOPohcVh8UiV3ZqQft+LH0C7Hx6/aZ0Z2bGt37qNJnnGJ2WC8/1hjIJmWpppMpimhU6p44G2UNdDknFdMVNoTRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EY6HSJye2t0Zv5zNi+57URMyW3Utpga4Iai4pKHvpIk=;
 b=Mexu/SS/bxfAPeuey9G0BAHrkDNtxmHtI8S1Tj7kibiyYJMWgnQ/uKm4swrhFBk9q+nmtn6+arsCmxXAehHbIK+xQXjavaIlg0dUka5V/02hHqu28ZAD26ZJ7Pq2Rqr/8CaYWhFZVJNfoGU+Sc2RMCvGMz4u3q2uKjBRjLA9oZAYj7PxVzU4W4TnYjssWByR2kkEtrnRNt9TeyZ/DQG2WWzdgGgzL+Ru/J+IkzTU/G0V4jnamR4atbERpw3XDe4i9rrJzHHctj4F2nKIan4g1kq7dQdjbmi50VrxBn0wuK3Idf/mWt6NfiGvc68c6zdV6bQo4JpLCyJwGekpZTcIkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EY6HSJye2t0Zv5zNi+57URMyW3Utpga4Iai4pKHvpIk=;
 b=2IXOxpQMqZ9vGZKdMRMHDmWDPSC2XuxU6LBuGJNm4j8W1qB5l3vxF2yHTBpe+ZEf6ZJ6aaNFRPWz197GaEig6XlRoh0W4lYpMkNxjNAs2TLg9nJMvB8WPpama68D0EcnfR3//hzsJ9KKXPCRxSnXctLdmE3F2g/5gZwi7BVo58M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DSVPR12MB999147.namprd12.prod.outlook.com (2603:10b6:8:38b::11)
 by MN0PR12MB6365.namprd12.prod.outlook.com (2603:10b6:208:3c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 17:30:53 +0000
Received: from DSVPR12MB999147.namprd12.prod.outlook.com
 ([fe80::98c5:8206:6a4:c445]) by DSVPR12MB999147.namprd12.prod.outlook.com
 ([fe80::98c5:8206:6a4:c445%3]) with mapi id 15.20.9870.023; Mon, 18 May 2026
 17:30:53 +0000
Message-ID: <340a79fc-864a-498c-bdfc-3c4929b5e9ae@amd.com>
Date: Mon, 18 May 2026 12:30:46 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] rtc: Add rtc_read_next_alarm() to read next expiring
 timer
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-rtc@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>
References: <20260518133853.851027-1-mario.limonciello@amd.com>
 <20260518133853.851027-2-mario.limonciello@amd.com>
 <6be68c57-929b-ccf0-84a5-6f40c4c0c330@linux.intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <6be68c57-929b-ccf0-84a5-6f40c4c0c330@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR03CA0066.namprd03.prod.outlook.com
 (2603:10b6:5:3bb::11) To DSVPR12MB999147.namprd12.prod.outlook.com
 (2603:10b6:8:38b::11)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSVPR12MB999147:EE_|MN0PR12MB6365:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ca59c5-c572-4792-9481-08deb5033626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|4143699003|11063799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MPVA1WwBIy9W/NuYgczH4tJrQl+Z7E6yaloW6tjvL+8qkH3MsXpWEpldpllBHagnXU1dD2AkatMunyzoHzPWv9dSwE6FsnJMa0SihsfbVykyobCO3gvmYcDT6F2wqQqQ5nK1SmZUftUvk5A+F/q90evl8Ch5n54qhZ5eaflLZgfC5Rws+z2j9u+sC8vZcNiXDCI1agn6i121uJj7VvIoQ8CuSsn0RGC1dDDxWjlFZqJa+USWOWAzI283iQAFiwL6x7EIcKndzUfCJHouuMR+1KRmoW/uIulMs7C6FSuTWdACp2Pciq9J2yS5jMrBxf0blWOiZvAK5XJeyqvNPlwIkB8Dkgy8dbec/sp2W/dAc9RnkGazwEz51fJJaBxdt21CnodCgA1lDMTJoOqXDEz3d6spBCX6DQh/Sf20Q0AQJs1FmP+HIp5sS0Rv5fDdbl1JxH92ww/hTcqsY3M43jUYuiWsqOPBKPPUCSLUDFUQKQoDN2EvwE1K/7ftPON50CErHGI2XWppbEfb856t2pE3SbKYPnKsv5goPl6jJKzTZt4+Zw2x9cd8nKHFPUHpm+H1PzNZ2ZEeF+BtXvHwn2XCynEC0tlDXlVXEF3eXHRtV8YwXp3Tx7iy/lIb2L4GStSbQNrsEqBUWWUH3Wp2I8dlMQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSVPR12MB999147.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4143699003)(11063799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1NaVnA5THFneFVDVDU5eDJtS09sVlJVbFVyZEs0MnJPOXJKd2dYelQyUVll?=
 =?utf-8?B?VTgrdXBDSjNsbHdkWU5PU2czbEwyQXgwaUsyY2tvbHdHcUtUbVJXTmZ0ZUwy?=
 =?utf-8?B?R1Fkb29zNkxnVm16OGNiblptTFZlN0c3eDkxcHllWlhsaTdzK3lSYUZjeWRW?=
 =?utf-8?B?NFNiMFp5cUtWaDM3ZlBzSnZMdXFxazBlN0cySmdrdHBtQlgyR1UyWGp2UTd3?=
 =?utf-8?B?ZDZjNjRMT1Rrb0pQd3E1YnpCU2JkTW1haFBseDFQb0RWa2o2Y3pOak0rZnBU?=
 =?utf-8?B?Mm5FRXJQSVNwMkFRNW5tZER2Vmd6QWI0bFBENS9DRTBYTEd5Qm5MMEpMK0s5?=
 =?utf-8?B?dExVQ0NJbllNMFlBVTJ5WUxlalYrb2gycWs0Vks0cDFnZnBIZXgxdmlPaktt?=
 =?utf-8?B?am9wVWRzMGUxS0x5UUVYaW9vRCtPWEFhZFlsemE4djBtYmYxc0pocVhLWG9S?=
 =?utf-8?B?SjR2MUZTUzE2MnNwNE1uRjQ3VTNLNGt6bDNsMTRWQlB5TVJhYUpFQ0s2WVF3?=
 =?utf-8?B?K2k2UlVjUG5xbGF0cjNaUFlvT0hURnpoQXQ2RExoQjdxcWxiSm9xWU5CYkw0?=
 =?utf-8?B?eGVRc1Q4T2k5dmthMXJtS013K1BjbUtiNTZmcTFwc3drL1dlcHVONHVtbVVU?=
 =?utf-8?B?ZnhLNFBxT00yUWIvbDFvdDM0TS9BbHdlMSszSGd5K0Jxd3F5ZnhtbXhFdzJZ?=
 =?utf-8?B?MVFiWkJVSmppV0x2UU8wazJ5U0NUZmRjTEovVnNvNEl0a1ZKQjA1LzFPazR0?=
 =?utf-8?B?bkJMeHJ5VTExSWgyd202b0FxTXdINExMV2U4TlNnU3dOQlV5alhZa2VjNUll?=
 =?utf-8?B?YjFueVRSMU5vYUdheTd3aldxZ0lvNWxCRkFrUEpOTlFua2lUaDBBOHBNdXdi?=
 =?utf-8?B?NGJoSWU3ZDR3Rm1LcWdLWXA3TGFabW50Wm5XemJEdWg4a2pmcXA4L1REN3Jw?=
 =?utf-8?B?Y2NycXZGRXhpQTlsdTNyV3J2a0U2anFZTTRwVUVPL0EyNUtIZld2NUgyWjls?=
 =?utf-8?B?N3NESWNJSUZqUkRwNTVrWHJvejFGbmsxYkRTV3llUVQvMjNnc0pjam9JSEdq?=
 =?utf-8?B?VDI2NGhiTWdUZkpWdzZVTHpRbXBnQkZSWmtWSk0yRE8zaXlxWWNlTUgyYXF0?=
 =?utf-8?B?MC9VNWloZzFYcUhaSm1RaXJ3SE1ta3VQWHptQ09McXArQzFWak1KeGFLU2hE?=
 =?utf-8?B?WEswdnlaNjdUbjFsL1plSXU1U2h1UWJTTlA5YWExWHE0NWplUUhEWHBFTGVN?=
 =?utf-8?B?aVRRa3B4Y3VCOTRleWpndGc4Q09qVnVuZGlYL1Bzd3oyemtHN1dNTDBxRjZl?=
 =?utf-8?B?bWRmbkwwazFsYWl2MVFpT3RCb2Ixd0pJQmpxc3NIVEhmM25KYXE4Y0pyNjh6?=
 =?utf-8?B?ZDJLSTVMUG1jN2w2a3hJMlN2dGZFbnpWSXEvZ0YwSmVlZDM2NXN0cW1HNTRS?=
 =?utf-8?B?Z2dGZG5CQjVaZStwajhCV1EyZCtOTUJyQVpyWUozaGpnT2RYZUQrbTlyR2ti?=
 =?utf-8?B?bFFmVnBRaVRrSkZPNkJpbVM1aStGRkVDRzB5aFQwOU5ibEY1aUc4MnMzNFdR?=
 =?utf-8?B?OEg5Z0UrV2tRMmFYTVU5c2o1UWFjcFdKZTA1NUttMGtxc2FRbitHSjlISndv?=
 =?utf-8?B?WWk4SElTbFIwM3VrMDRjeTNNS1VUNG5CMjhReGlQWkJyMmN0c0R5aEFHMitl?=
 =?utf-8?B?VmpoVkhrY3lBMWdXYzRrU3o0ZjdMM2F1cXJQTFNjbW1WSHE4a1Nkb090b2to?=
 =?utf-8?B?NVdIQXZtSkV4TVIrV092K3FrSWMxaDVzTUFqdTJNZ2lUdVZuWFJ6NStNL2tp?=
 =?utf-8?B?NDNiOGthc0ZvU2tqVG1tSjVsNDhnZU9URXdwN1R6T2NUT3BJaEd2eExnT1Nl?=
 =?utf-8?B?RWtjTlM3UzFzYXhzMDVkVXcrNWw2UzlKcjQvcUU4NFZFRFVOSWkvQ0ltaWVx?=
 =?utf-8?B?Mnh0MlgxT3hPdTkvK3VzYlFVdzFLcmlTUmdjQi9HL3ZkMmJWYkFieVptaGJs?=
 =?utf-8?B?UUdsc1pWUUptWm9aaVN5MGRCR1hVdjJVbksyMkJDaXhRWXZDYTgzL3U0Ui85?=
 =?utf-8?B?cldEdFo5U2pIZDZjOU9tOFBUQ3l1Vlowc1BuUXBvL3EyUkpHRzFEcGM0RFBz?=
 =?utf-8?B?bUczWVlRSmVJc1VYbEFNQkd0Znh0RjAyY2xyTjNNUmJxMmMxbVk2cVh1bjkv?=
 =?utf-8?B?QUJzMkJINXBHaGVURGNRVWZvaEhUYVppR3dYZHhLeVNoMmM5U01Od25ZNVI2?=
 =?utf-8?B?T3JhQlZua0JsUnFsSWhIekp0MWpxZEZWM0ZiNEZkRGdQSUdZVGNCYkxwZFV4?=
 =?utf-8?B?azR6eWF3ZUU2VGQ1Z3NHZHgwVFpjNkxrcFFmTFdhUDAwMk5YN1Y4UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ca59c5-c572-4792-9481-08deb5033626
X-MS-Exchange-CrossTenant-AuthSource: DSVPR12MB999147.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 17:30:53.2658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cpsgt9gG68Xw8TuGvd7NCK5m94V6bWpnrCWD1yCn9bDW7TjFyu3fKTl+8gKtUnRB4CVNdt6E9rOnbEPoZiBCwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6365
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email,amd.com:mid,amd.com:dkim];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_FROM(0.00)[bounces-6545-lists,linux-rtc=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 79842571A4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/18/26 11:48, Ilpo Järvinen wrote:
> On Mon, 18 May 2026, Mario Limonciello wrote:
> 
>> Add a new function rtc_read_next_alarm() that reads the next expiring
>> alarm from the RTC timerqueue. This is different from rtc_read_alarm(),
>> which only reads the aie_timer.
>>
>> The wakealarm sysfs file programs the rtc->aie_timer, whereas the
>> alarmtimer suspend routine programs its own timer into the RTC timerqueue.
>> Both timers end up in the RTC's timerqueue, and the first expiring timer
>> is what gets armed in the hardware.
>>
>> This new function allows code to query which alarm will actually fire
>> next, regardless of which subsystem programmed it. This is needed by
>> platform code that needs to program secondary timers based on the
>> actual next wakeup time.
>>
>> Link: https://lore.kernel.org/all/87ed50z0le.ffs@tglx
>> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
>> Assisted-by: Claude:claude-opus-4-6
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/rtc/interface.c | 42 +++++++++++++++++++++++++++++++++++++++++
>>   include/linux/rtc.h     |  2 ++
>>   2 files changed, 44 insertions(+)
>>
>> diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
>> index 1906f4884a834..dfcb32e272eb9 100644
>> --- a/drivers/rtc/interface.c
>> +++ b/drivers/rtc/interface.c
>> @@ -384,6 +384,48 @@ int __rtc_read_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
>>   	return err;
>>   }
>>   
>> +/**
>> + * rtc_read_next_alarm - read the next expiring alarm
>> + * @rtc: RTC device
>> + * @alarm: storage for the alarm information
>> + *
>> + * Read the next expiring alarm from the RTC timerqueue. This returns
>> + * the alarm that will actually fire next, which may be different from
>> + * rtc_read_alarm() if multiple timers are queued (e.g., alarmtimer
>> + * and wakealarm sysfs both active).
>> + *
>> + * Returns 0 on success, -ENOENT if no alarm is pending, or other error.
> 
> Missing :

Like this you mean, right?

Returns: 0 on success,..

> 
>> + */
>> +int rtc_read_next_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
>> +{
>> +	struct timerqueue_node *next;
>> +	int err;
>> +
>> +	if (!rtc || !alarm)
>> +		return -EINVAL;
>> +
>> +	err = mutex_lock_interruptible(&rtc->ops_lock);
>> +	if (err)
>> +		return err;
>> +
>> +	next = timerqueue_getnext(&rtc->timerqueue);
>> +	if (!next) {
>> +		err = -ENOENT;
>> +		goto unlock;
>> +	}
>> +
>> +	memset(alarm, 0, sizeof(struct rtc_wkalrm));
>> +	alarm->time = rtc_ktime_to_tm(next->expires);
>> +	alarm->enabled = 1;
>> +	alarm->pending = 0;
> 
> Doesn't the preceeding memset() already clear everything?

Yeah; good point.

> 
>> +	err = 0;
> 
> Why is this needed?

Oh I guess your point is that err was set to zero by 
mutex_lock_interruptible() already, so this is unecessary.

Good catch, will drop it, thx.

> 
>> +
>> +unlock:
>> +	mutex_unlock(&rtc->ops_lock);
>> +	return err;
>> +}
>> +EXPORT_SYMBOL_GPL(rtc_read_next_alarm);
>> +
>>   int rtc_read_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
>>   {
>>   	int err;
>> diff --git a/include/linux/rtc.h b/include/linux/rtc.h
>> index 95da051fb155d..c09fc22819d0c 100644
>> --- a/include/linux/rtc.h
>> +++ b/include/linux/rtc.h
>> @@ -190,6 +190,8 @@ extern int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm);
>>   int __rtc_read_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm);
>>   extern int rtc_read_alarm(struct rtc_device *rtc,
>>   			struct rtc_wkalrm *alrm);
>> +extern int rtc_read_next_alarm(struct rtc_device *rtc,
>> +			       struct rtc_wkalrm *alrm);
>>   extern int rtc_set_alarm(struct rtc_device *rtc,
>>   				struct rtc_wkalrm *alrm);
>>   extern int rtc_initialize_alarm(struct rtc_device *rtc,
>>
> 


