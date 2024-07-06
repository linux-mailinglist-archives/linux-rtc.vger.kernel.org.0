Return-Path: <linux-rtc+bounces-1446-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1DE929198
	for <lists+linux-rtc@lfdr.de>; Sat,  6 Jul 2024 09:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 074011F21369
	for <lists+linux-rtc@lfdr.de>; Sat,  6 Jul 2024 07:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5325120B04;
	Sat,  6 Jul 2024 07:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="1hSQZ/8o"
X-Original-To: linux-rtc@vger.kernel.org
Received: from refb01.tmes.trendmicro.eu (refb01.tmes.trendmicro.eu [18.185.115.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7552D1C69D
	for <linux-rtc@vger.kernel.org>; Sat,  6 Jul 2024 07:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720252228; cv=fail; b=g6EQ3YjkvBm2l7vuduqrCawzs3Npq3rEmlLHYX73+kxFL95UvyVIeCAwByiCUYrcNKhxY/y0h8eE5MRbYOdKRjVSBmz6F8brTAQY+48Vg0ay8lCp+/Fc2OovdQLgsCTsFAS1wYl8GgZMGPNUkx3ozDL97BBq1SfWOKD9756YWps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720252228; c=relaxed/simple;
	bh=reVS4XwYvyCpQsiovCtEEx8v4RdLPuAfb0QRQ8fW894=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uL6W4crZqLQy31WIsaJCdxfVzAwoibVYI/rK6RZGZmqXs8gNxwppiuGVILR0Q4WEISCmPZZDAJPn8dzrvNUjfb+o+OFBS/SJzVzckQSrafxstOQLa3LvGA8gjI83rudbXCVqHxlLomn4B19NwRON+tz8xPeOr52lMLGUIHrkMA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=1hSQZ/8o; arc=fail smtp.client-ip=18.185.115.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Received: from 40.93.78.50_.trendmicro.com (unknown [172.21.19.202])
	by refb01.tmes.trendmicro.eu (Postfix) with ESMTPS id 0FA3610054A51;
	Sat,  6 Jul 2024 07:50:24 +0000 (UTC)
Received: from 40.93.78.50_.trendmicro.com (unknown [172.21.186.216])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 5C6B910000654;
	Sat,  6 Jul 2024 07:50:16 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1720252215.387000
X-TM-MAIL-UUID: 3813722c-175d-4ff0-8a2f-aa7b1460fc26
Received: from FR4P281CU032.outbound.protection.outlook.com (unknown [40.93.78.50])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 5EAB7100003CF;
	Sat,  6 Jul 2024 07:50:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKKftTb8MKdFk1ZtxwDujK83C7YF/MxlDgtsYP04p6hwFAYXHxtWmQudatek2Cgh93SrMpkppbHX7ahtNOz3+1TsILDXFn5hehJHzMMAOC/rokmY2He9Tjt+XYYwnacc3I/Ffl7cCmCa2Kl5BqqnCr+d5E9qJ8vUV1f9bl5Z68+eO+9Nk3shG1I6A81yN9MxkITHkFMd11gS23dORUbgkd5DImistOjan8wnBPwYC37ymP3PwgxNKN8wSYERZI8qT27tYrLnnmFj1OpzA4NMxvc+o1lf/ed9aUP0C0ygYHH9X9wrZpicmz74AJKDGdOX6jqZ1LlUTx4UwgUciEoSDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEgJJEv3fWzJ2sr6G8LURUMtp/FvWi/LQ2bhi5UMSf4=;
 b=Kj99ys1xxS8GIiK7Mm6+PKzNpJWJd6ZQBJ2Q3yJEmSDK/Yk8ov+dLS5VHJqBh5JZAEBN9wXq2Y/MJx2ORXEef1jB7fQtsKLwSisSemNo/Dy//HfzfmhOiXOECzbnJxCUXc2Si2pB4/vSh3TynGGu1zvE0/kBTgXSOySklCZYepEqqd/w+L4mEqPLUXUqsQUme+00kBSclvlx2n+8CL6PaJEK2zLXxRLvuvqMBNNDLOQM86PqpONEXCp3MkJJfNhe6FtMpBqGhumHoL/fWi485EEnFezn6vy96mAINW/PvWLECfmWJmVZ/+fI1OtiDA3Q63ZI6WW0+K5ZpeNolEvROA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <7660500c-c90f-4db0-87d5-05abd1cb1dbb@opensynergy.com>
Date: Sat, 6 Jul 2024 09:50:10 +0200
From: Peter Hilber <peter.hilber@opensynergy.com>
Subject: Re: [RFC PATCH v2] ptp: Add vDSO-style vmclock support
To: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, "Ridoux, Julien" <ridouxj@amazon.com>,
 virtio-dev@lists.linux.dev, "Luu, Ryan" <rluu@amazon.com>,
 "Chashper, David" <chashper@amazon.com>
Cc: "Christopher S. Hall" <christopher.s.hall@intel.com>,
 Jason Wang <jasowang@redhat.com>, John Stultz <jstultz@google.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20231218073849.35294-1-peter.hilber@opensynergy.com>
 <4a0a240dffc21dde4d69179288547b945142259f.camel@infradead.org>
 <8d9d7ce2-4dd1-4f54-a468-79ef5970a708@opensynergy.com>
 <bdcafc76ea44db244b52f8a092287cb33950d5d6.camel@infradead.org>
 <db1113d5-a427-4eb7-b5d1-8174a71e63b6@opensynergy.com>
 <c69d7d380575e49bd9cb995e060d205fb41aef8f.camel@infradead.org>
 <2de9275f-b344-4a76-897b-52d5f4bdca59@opensynergy.com>
 <BC212953-A043-4D65-ABF3-326DBF7F10F7@infradead.org>
 <51087cd7149ce576aa166d32d051592b146ce2c4.camel@infradead.org>
 <cb11ff57-4d58-4d47-824b-761712e12bdc@opensynergy.com>
 <3707d99d0dfea45d05fd65f669132c2e546f35c6.camel@infradead.org>
 <19c75212-bcb6-49e3-964d-ed727da2ba54@opensynergy.com>
 <02E9F187-A38C-4D14-A287-AFD7503B6B0F@infradead.org>
 <02077acb-7f26-4cfb-90be-cf085a048334@opensynergy.com>
 <352a7f910269daf1a7ff57ea4a41a306d6981b21.camel@infradead.org>
 <9b33c44f-3855-4c7e-925e-2f4af3b0567a@opensynergy.com>
 <24a6fd46a3383aa8d18d19511b8422baad37317c.camel@infradead.org>
Content-Language: en-US
In-Reply-To: <24a6fd46a3383aa8d18d19511b8422baad37317c.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::18) To FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:34::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR3P281MB1917:EE_|FR3P281MB2031:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bc58e51-891f-455a-6f75-08dc9d904552
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVNIVnRzQW5HYmdkNytEWmJHNmM2blJPaXEvZHRqeTFNUjBJN0ZjSzM3bGQr?=
 =?utf-8?B?Z0cwQnJZY2ZXTnFBMk1Cdk90bU10VktDbDltNzFGbVZEdUhmcEVWTzVFUnV3?=
 =?utf-8?B?UFd5WXR2Z0lMUTlDczVQaVRWT0tvZzc1b2dwa0hwQ21rVWJXbEppZytSRzBz?=
 =?utf-8?B?ZXdMTFBtMjhrKzdNdTN2bFkyZ1ljOWFST0VVMi94a0xXUzlFYWJ4a29DcVAw?=
 =?utf-8?B?SWN1a1dwSGJRdE51b0JVSlVjQlFkZ1BhNDhWZ0JGVUJnOVZYeGVwYUhjd2s2?=
 =?utf-8?B?cXZiT3JUbFJCSllpU2wyK3dNVGpJUUJlM3lQdWVTbGNCaWNKcDhEclUweml4?=
 =?utf-8?B?eERnMEp1VjhYZUhxMHpnUVZ6Z056cUtFNFdlUXVBMVdmQ3J6UkNjZTJub3dz?=
 =?utf-8?B?dUU0d24yRG1wZEttTU5pYlpkcnpPaXI4TnBIT095RUlIOHJQSFlXdko3TzJR?=
 =?utf-8?B?bUw2ckxKK1FNY1dWSlYxeXQ2d0dCa2d1YXJ4eWRwdS81WTJGeUExdGE2emxU?=
 =?utf-8?B?MXRkRXk3MHVyOVNOWVNDcnR6NW41QW9xL3lvQ1J2bUROOHBlVlQ5RENUY1ds?=
 =?utf-8?B?MUlSSDVvVFV5eUc4QXNVVzV3WWRUWjY0dDdPbHpRZUdzTVAxVmZGeFBrZStT?=
 =?utf-8?B?cDBBeDlldi9CRXlhSkUwRDJKWU1paFNMcTd1ZlpNZ0J1Sm5WWXl1U3ZGaHRy?=
 =?utf-8?B?MDlqNEJxaTRKRGhSYTcyYTNTUGRtVVJXcW5pVno3MmF5Rk13a3YwMHYrMWNt?=
 =?utf-8?B?WUN3SVVNVjJ5dVhsV3JQOEtTQldnNEhvSUNiVmlqNDZMUDNmNHVuckxTUWJk?=
 =?utf-8?B?RDBXY21VN3RGTXhyZ3gzcWdHWVEveEZVNWdOOU1lSTREU0F6cW85QXI5WGlG?=
 =?utf-8?B?bzIwZkdKQ2QyVVRWZHJtVy9CeVJxM1NxcG9weThENVg4VjVMRzR6bElsam1h?=
 =?utf-8?B?SmFlUVY1VmlMTDBOMldnb2ROZFdtRDlISWVHT1o4WXRXMkVXdEY3TU9VcW9r?=
 =?utf-8?B?UERtWWdEb2R0ZnBheGU1SGsyT3g1TDNscktyVlh2U09sd3daVW84cFBpMXF0?=
 =?utf-8?B?c3g4cTlxTFg5K3RXaXVJM3pnWWVPYWplVVBIbmNGbEJ3b2NORTlyTzNXbnps?=
 =?utf-8?B?WTZaMHhnTEM0Q0NJb2QvZXBveE5zeHVuWlZWdWwyNzdhbmhicXFHZklEZWVN?=
 =?utf-8?B?aGhnS1UvdHhhZ0NZSVpTUEdOV2x0Rmh1OGxhMEtpYy8yRUhTN0FiWjRya21V?=
 =?utf-8?B?WlphRkFqR3dDb09YTklPL0hQREgwSC9ZM1p4cGJhN0ZYSEphKzVEUW8rZVJp?=
 =?utf-8?B?eDg3S1VYNWhNRmZpTVFLNUR6bEJRTWMyZSs3YWlNWVRkMGFrNU1JM0hTOEtl?=
 =?utf-8?B?RTYvT0dkYnpoZjdmL2ZNampkK1hjNUdUVVBwbXpURE85TnJnZUxEcmxRY3Fa?=
 =?utf-8?B?WXhMVExFQVJBSm9KMUc2T2wxdjRYSENOdVZkZXRTOFBhTllORk9uUEtSL2JG?=
 =?utf-8?B?UUlnNjdZcE5OMGtqSk40T1RWMXBZeks2WmxveEN0dVFKN3NET3NOVTF6M0M1?=
 =?utf-8?B?Nm5TM0hZSTFMWEVoN0RhckdtcnZXcVJWTGpyajEya3Y3bzkzQ2g0YXVmVHp3?=
 =?utf-8?B?cjN5TENpcUd2MjZaTnlGbUkrVVpRbE5Va3JqK0lOYWNVNURsTFdpeW9qMm9S?=
 =?utf-8?B?U1ZlRlRucUs2YjVXeDRlMEdIRDFiTEVBcWhvN2N4ZDBKU0QrRDdQQ1lHMWhs?=
 =?utf-8?B?bUFORUZubFAyaHRVK3N5R3ZXeE1FQTJXWlBCb29WWWRtQkJ0SzdobitEcE1B?=
 =?utf-8?B?N1hIdDJTaEZvS29lUnNXd3diWHJSeWN2RTVXbmc0bXJtRlFzeVpoVXN4NWVj?=
 =?utf-8?Q?PYJ/mXbNgm+ug?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXdmUHRRN2NsUVdIazlJallOcXBlS1p3TTQ2cjlGKzdMalRxa3VEaUJYbEww?=
 =?utf-8?B?OU5RQ1pPNFExUWJlVFJjampwN2NUQ3FSWThlQnFleE1xVlZOakQ2c1UwNkNa?=
 =?utf-8?B?UTZQcmFDa3J5NElNUUpMeklvRnFDSVM0MXBCc1lYZVlNY2FrOTVpL1plQWg2?=
 =?utf-8?B?ZFZFaC9SS0hLQlN3eU1FT2tsN0h1cTVXZkhHZFdCWStlcmdyVE55NEtsRlFB?=
 =?utf-8?B?K1ZCekllamFac3dsUUQrQXdqQ1YrWGtpMXM0L21IMWNtTlNGVFNLb1hldTBO?=
 =?utf-8?B?YzM2azlTb2EzQkUvL0gxUWlqbDNRK0JpbDJNOS8vckI5cnFBdXlhcFVFMHFN?=
 =?utf-8?B?blhZKzE3TVF3T0hDaHNuMUxLcUZEMnlsWCt5cFA2NU5zd0w5VlN1M25KMUQ3?=
 =?utf-8?B?T1YydGFlSDNkN3dWRHhZLzNJMUFEUEpRYktGaUkrakpsQ2F4N2U3OU4wWXdU?=
 =?utf-8?B?N3RYR3U0RUR2VlhrTkJlL0lMVWJ0ZDF4ZjMxTzJuM0JCYXFJS0pQKzBVZThW?=
 =?utf-8?B?clZTc0VndThSL1llYklIdUY2Z1lqMHRNRGlqSGdpYWFGZWNteXloS3crUmZT?=
 =?utf-8?B?dGhaeVMvR1M1VzZ2RXJocjRDZ2VlblBWbDY3UTBNODNXUXhIY0o5MER0R1U0?=
 =?utf-8?B?MGxQaEFGV3JtOFVWMHl1ZmVnV2wwbjlDMjBqVU9Eay9aZUZERmVxN1NUUFlp?=
 =?utf-8?B?WmM4dlBBSTR0b3JHSElIbTJrK1Btbk9odE4xa3BXdTFjYlVDejk2NXZQUlh4?=
 =?utf-8?B?dFFPVzNFcE05UjRKaUVrZFphVk1oeHBIM1I2V203bGlXRUNBTytNcEp2MWJD?=
 =?utf-8?B?UW9OMFIyeHlVY09QeE9xTnhJaVIxWW9IMGdVZkFmNVFmQW1WOG5nL1E5a29i?=
 =?utf-8?B?M3psb1Jid1pJYk0vV0xya1l6L0lVZXRYdy9VcGxtMVE5WTUrL3JBNlRLbDNY?=
 =?utf-8?B?cHZyWVJkMmJvSFR0YW5YNklkOUdXQ0NyTFF0eWJFTEo0U2lFMVAxWEJYUFY1?=
 =?utf-8?B?c0pLTGlaMnJqazJoajgzYXVQc3NPcmNGdElNSmxEU2ZwVEVUL0tSWVVBSEJQ?=
 =?utf-8?B?U2NSY1JqeDJuekJKQ0x3SjZSQTBXOUNOWGRkRS9zZHFMOG9PalpWQVI0c0x3?=
 =?utf-8?B?STNXL0hGZHNzMkZIOHJFSGF6TGlycGJOL0lBSERMWnJkdFZ3YjU5N1dNWnkr?=
 =?utf-8?B?bUlzTUlWL3d1TEFsMkN4NXJ1ZTBCY2N0eVVkaHltTkgrSkl0c1p1Z3gvbGtx?=
 =?utf-8?B?eW5jcGU1VHNjWEh3NDZUSU1YekliY1NUaWxoRUpLcU5UeFB3U3p0OVI4Tm5V?=
 =?utf-8?B?WnJ1NnhKNWN0d0JSQVhmRjFrZml4NkIrek1rVTRkcEN1L01TWmRjaHBnVzdl?=
 =?utf-8?B?OXlFWDNMQitsRTlndm5ENFZtVUwrY1hvMDJBY1k1R01YeWFFaHNxMnVXV1Zn?=
 =?utf-8?B?NWpEb1RBL09aU2JRUjRKVitkcUFKU2JCb0VSU0h1Q0pNbDEzSEhoS3dDQjQr?=
 =?utf-8?B?Y0YyQ3ByNVczcjBxV3pxRUxCN2h1emZRa200ZEF5Rno2dkFvT0xGM3Q0c3hG?=
 =?utf-8?B?VEozZkR3RldQVlNQVlFta202djZTVTExbGwvNUJ3UUFkc2hqVnhhS3BMS01u?=
 =?utf-8?B?MGUveHdpUkNWMlVPTDJSS2hmejRqaEp2aWZVdWFqT1dGMXNmR0FGbHU0VFgw?=
 =?utf-8?B?aHU2VnhsenFUb25SbGpFM2MvWFRHWDJvM0sxL0RKMk5PaTJkRU4wVUhvR1FJ?=
 =?utf-8?B?NHVPZG55OUxVUlhUWWN6ekpIZW03bjVzblZJYUNkQkJSZzFBQi9YSHg0c3lD?=
 =?utf-8?B?KytiVUNFMFp4a2pCdUs4UmtqUHNRMHBOZlZaMkZQay9sWGcwdWJVUHV1Vldo?=
 =?utf-8?B?Y0dMRFdURkV2TVVsSkJSdWJYRnZzSmpjdjA1WVZoWjBENzQ5SStTVC9ZSmRI?=
 =?utf-8?B?aDliTnNsY09EWEh2YnBZYnA2UEQrTmRlcWZGd3A0NE9hWmxTNkxQMlRYRGZl?=
 =?utf-8?B?SHgwZE9QNnhBRzVEcWswNWRmTDBOUW1jYTVxZE9XRmxOc3J3b1pZVXpuK09L?=
 =?utf-8?B?dWZhR1JZTTIxMlh3MEhJUktMSHRKRDB6WWs3RFJGNXRXd3VoYmNibGdQVEhp?=
 =?utf-8?B?R0tuT1I4NDg0L0pza2FDZEUyWTlwL0EyY08zVVVwMHh4dFcrWmpJVVNscHUx?=
 =?utf-8?Q?799VNE/fTc8vAgy4DXUciHLuP5OE0FuzOg7X4F5uDPYI?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc58e51-891f-455a-6f75-08dc9d904552
X-MS-Exchange-CrossTenant-AuthSource: FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2024 07:50:14.6766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VjTTaLecaJywwDnJW3VuILK13x4Lq9lw6P4VcY/L7YXI7zFq5URMJ7AFrMYMFJKFYjllBLXU9U2gcE4OrBoipg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR3P281MB2031
X-TM-AS-ERS: 40.93.78.50-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1026-28512.006
X-TMASE-Result: 10--15.075100-4.000000
X-TMASE-MatchedRID: 6otD/cJAac35ETspAEX/ngw4DIWv1jSVpolXqDXvwwphwrHzkyNIlaXi
	cGonyj1pF7wI/GkECICwvGp2wlHVUIuA+CD/W2+Ra3/ivePgGTzGCI8DPyXV+8Dy2KKuKumVGC8
	MszMtCe7XdfUDT7CrmnhvrEfbRzzXrC0NytMhAODsWvLjh/4YUtA8uiVRRVmWR8D6aEu8Yk2tbh
	TKqzFczTfTDCVI7/VScpxxqdM2ODDg+5w4ygvpjyw57foj4iEhtwSRbcjubiRSMzx3ql2YQ8yfx
	QnKP1ktupoogdfVK+Jd4x1IUlKnFI1g3zDt1sv5eZOzHdy7Qc5LmwaA0hCee2dtARg0IcL9qDtm
	jlQ4FGmiWLhmiI4dP34gKq42LRYkASOwxLdYcJnN9tK9I4gZ7cf3ye8/TE4yTgMq552Ab2B+3Bn
	dfXUhXQ==
X-TMASE-XGENCLOUD: eeb95482-d88a-468e-8f95-9dfe300f2a6a-0-0-200-0
X-TM-Deliver-Signature: E6720385FD30C8F102BAD53CD831CBD4
X-TM-Addin-Auth: FCD5vDoVqFX+dmhUW9KB/444Ut95RaSayhx5BK86uC4mN4hoWOGzFuMfspC
	IXhg7uYSuKhBuTbWW3CvOCxA35qF/ABUDX7d1Y9kt1RF2v7NzFNDNzwB/VjBFC0TnTQ/0h8Kydb
	8RtV5vfsOgHQXnbtSObyM8dc7fTVPXivEgnBzR1CH0f6Vr637CLNupqWA59AmaMhVwxerVau049
	XqSJKAEGpF2NbiMEQL1T+oZ1gCE/vHIj+muBpgAA5rlNclMNYBoerGNWgAWen2zunpimbt2A6JK
	VS9fr4JuBSGCbHE=.R+Xn6PUFXHAZ7UHvc6YoOKQlV8UQC+g6VWy5Cmq/Vx+t8i5CEuqpPNR1RK
	6qrrMTh1t2ytACbmQmqM5HFudadPZO/cv38F2BkxhxMoKOuVg3pPUav3+fmOwV8DEIXZOZIs+E2
	hhJ03sY2MDrALwTY1Rl4CT2KFgz4xuTiO87aGFz8OsS/0MAuG1AG5IDYuDDpkrnK3hxIov4yBtF
	f1GICFJXtvR5nd3byaZKiD6MSCM2WYjh/NVHxX9AkIJ5oDtP5zxtd3JtqcPAJ1O4VnXO0lculaU
	JvV/abnYh4AV3XGljXL27DR9fOYuHHD7XNt+y9FFECvjOv9R8jj8sM9l30Q==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1720252216;
	bh=reVS4XwYvyCpQsiovCtEEx8v4RdLPuAfb0QRQ8fW894=; l=1882;
	h=Date:From:To;
	b=1hSQZ/8oesLXF267MSoJbxE+gLAW/sSrhIrsWSRvhpBE9/Xltu5pnogeC8DwA2U3y
	 nFUwIFWFQHf7xfnqHImS0E5hVkGbTNAWpzA2aZ94EBwle+r/X3R/uMUwhWLCExt+F1
	 /Tq04P64Dimr/2uTz7DNIaHPbp5ATCCkVpkphQJ+MsX0jqtWUvRALkcZpKAVYrtW87
	 6K8EqVmuYqZqCOrFdVGZPRKeT5/oSP487QY6BxJ/7QwnqzGdyfRUalJzrlq3PGa0QL
	 giE5TjX+0PFpGDkAzLn69zVAzddMXO4M6GW4gNe63H6hOGtHDL1Su+znV4nB+hi6Br
	 +yrrRCmictEHg==

On 05.07.24 17:02, David Woodhouse wrote:
> On Fri, 2024-07-05 at 10:12 +0200, Peter Hilber wrote:
>> On 03.07.24 12:40, David Woodhouse wrote:

[...]

>>>  • Why is maxerror in picoseconds? It's the only use of that unit
> 
> Between us we now have picoseconds, nanoseconds, (seconds >> 64) and
> (seconds >> 64+n).
> 
> The power-of-two fractions seem to make a lot of sense for the counter
> period, because they mean we don't have to perform divisions.
> 
> Does it makes sense to harmonise on (seconds >> 64) for all of the
> fractional seconds? Again I don't have a strong opinion; I only want us
> to have a *reason* for any differences that exist.
> 

I don't have the expertise with fixed-point arithmetic to judge if this
would become unwieldy.

I selected ns for the virtio-rtc drafts so far because that didn't have any
impact on the precision with the Linux kernel driver message-based use
cases, but that would be different for SHM in my understanding.

So I would tend to retain ns for convenience for messages (where it doesn't
impact precision) but do not have any preference for SHM.

>>>  • Where do the clock_status values come from? Do they make sense?
>>>  • Are signed integers OK? (I think so!).
>>
>> Signed integers would need to be introduced to Virtio, which so far only
>> uses explicitly unsigned types: u8, le16 etc.
> 
> Perhaps. Although it would also be possible (if not ideal) to define
> that e.g. the tai_offset field is a 16-bit "unsigned" integer according
> to virtio, but to be interpreted as follows:
> 
> If the number is <= 32767 then the TAI offset is that value, but if the
> number is >= 32768 then the TAI offset is that value minus 65536.
> 
> Perhaps not pretty, but there isn't a *fundamental* dependency on
> virtio supporting signed integers as a primary type.
> 

Agreed.

