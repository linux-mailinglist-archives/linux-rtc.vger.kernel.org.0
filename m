Return-Path: <linux-rtc+bounces-1422-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE8891BD7D
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jun 2024 13:33:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC2C01F2318A
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jun 2024 11:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D1F155CB6;
	Fri, 28 Jun 2024 11:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="mJMaK5gp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from refb02.tmes.trendmicro.eu (refb02.tmes.trendmicro.eu [18.185.115.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E9114EC7F
	for <linux-rtc@vger.kernel.org>; Fri, 28 Jun 2024 11:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719574409; cv=fail; b=tuZF9ok9HcTyzvMAsr6pYow9mzH0fuDSsUFgf+CFfTLeJxIHJHlZtlxHvvo5Rbc4tGvewEUwpnL3XDchZGklV91Ixuk8F1KzdK8h6+juQcOoBpoarsdOUpeEuagKG2sn6bcm7WPSIm5du6IZLi9pE4z+I6a4evp/+k7WRNtS3sI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719574409; c=relaxed/simple;
	bh=3as4jp5BhbwzLG8fMmHzyxB1i67IM4F3A+Ckd3sdb4I=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Cb5Scz6Ox1049WO2yKYho7owHuWqcWlcYQyM6XD+GpqWyr/1EH+02bgJvQD4ItMIfwdCMGd/5vheugYuTRfIuawV3RtsFCpnTcjaPHGXCkCx6DqjZitl41PMq1SPv5zHCVx+WoGTAMECryABhoSBH6oP5EKkO6sRUwI4kFuZ4yU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=mJMaK5gp; arc=fail smtp.client-ip=18.185.115.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Received: from 40.93.78.49_.trendmicro.com (unknown [172.21.10.233])
	by refb02.tmes.trendmicro.eu (Postfix) with ESMTPS id 2F1C91003CB6C
	for <linux-rtc@vger.kernel.org>; Fri, 28 Jun 2024 11:33:25 +0000 (UTC)
Received: from 40.93.78.49_.trendmicro.com (unknown [172.21.186.216])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id EEAE7100004F7;
	Fri, 28 Jun 2024 11:33:16 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1719574396.327000
X-TM-MAIL-UUID: 1d2a6381-1dca-49ad-8163-ac2cf5f66ee1
Received: from FR4P281CU032.outbound.protection.outlook.com (unknown [40.93.78.49])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 5006D10004C2B;
	Fri, 28 Jun 2024 11:33:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXmXRjDyEgvQKgYAHCxVjjpnbU/CV9pt4acNo6kM9y3WCU825ICCiowwfqhvpC2JjBtmlT37kQ7nN/LOLBZxXr9sqErBuLCThPTJst7+dTQyycTE6cLc3hNjFF+J+txXVrMkK9lOj01pRESAC89ZWqv7AguyCM9FGE2asdOMtyBmirhM+7guS2GTIeP4gLp4vbBvF+q16+SKPIjFeMe+vPdO6FEq4xkXKW67/C/iGFhnAljIwPwZJyM2KpnjSq0alsP2GCOTaa2dmxZJYl1h8fkj17ZWUb9XkjZdMCSY6UBjAdUew+R/CI6O00ghEmdw+/lHgbyl6T4TG/EYyUd+Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1edANRXE74ZxPQ9FOR+mwAWvPqSHB8T4bgInxkZsfa4=;
 b=CD4718XdeUa+W3JfJ3LmB0H8AtW5ApPGh9AtnwizZP1mKbmkdg4Esm7CKkPLh4/0QFsmAEt8Bhk3OvB7r0/czd3Njq6XfEDt7xdSZK+Ju+dgvh0ozgf14ZFousExM4oVkTKp9c5RQLgdySJIjMNXWLiTGlb8tzTcr4bE+Q+XuQGDTynkxWAzxt5cxoE2BukLAXnmsTxaR/GbKHvhgN+gSttG0AGJjKoksG8hOwGchhY9unw5qwYOegHInvifB/tB9O/4UvdOyit0Pz+T2DJ8Fk4V/inG8DP2o10ToiNF8fytWRRBFJPc2p8n+YG6m1NHTP0Tcoaxw43j0/bTnBTyGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <db1113d5-a427-4eb7-b5d1-8174a71e63b6@opensynergy.com>
Date: Fri, 28 Jun 2024 13:33:13 +0200
From: Peter Hilber <peter.hilber@opensynergy.com>
Subject: Re: [RFC PATCH v2] ptp: Add vDSO-style vmclock support
To: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, "Ridoux, Julien" <ridouxj@amazon.com>,
 virtio-dev@lists.linux.dev, "Luu, Ryan" <rluu@amazon.com>
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
 <684eac07834699889fdb67be4cee09319c994a42.camel@infradead.org>
 <671a784b-234f-4be6-80bf-5135e257ed40@opensynergy.com>
 <db594efd5a5774748a9ef07cc86741f5a677bdbf.camel@infradead.org>
 <c0ae63fc88365c93d5401972683a41112c094704.camel@infradead.org>
 <4a0a240dffc21dde4d69179288547b945142259f.camel@infradead.org>
 <8d9d7ce2-4dd1-4f54-a468-79ef5970a708@opensynergy.com>
 <bdcafc76ea44db244b52f8a092287cb33950d5d6.camel@infradead.org>
Content-Language: en-US
In-Reply-To: <bdcafc76ea44db244b52f8a092287cb33950d5d6.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::20) To BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:3d::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB1906:EE_|BEYP281MB4460:EE_
X-MS-Office365-Filtering-Correlation-Id: c4120877-b380-445d-287d-08dc9766193c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0FzTlp5UlF3Q2V4emdsdXQzNi9oWm1DUGFCa2hyZ1BpZ21VNmpZOEkrU1Bx?=
 =?utf-8?B?dmk0emxNVjEwSExPWWZGeGRtbDIxcUx0RnF2VXpLOU9DRHlkK1Fibm1iUXV4?=
 =?utf-8?B?aCt4dE55MUIwTTBsdGZGQkNRV2poZjIzbDNyQW5aakdhUjZyRXpIOVBHSXhN?=
 =?utf-8?B?Yk5BanBOWG9sU2FBeGhvQ2xwUmFnL2RxbGpoNU9US0I3NkU2ZjlKZlpQRHA1?=
 =?utf-8?B?c1lUTmgweGZDOWZhcVRLSzlnRjJpL3M3MGc4ZDk4RjdPMFZWUHhGeEpCRTdK?=
 =?utf-8?B?Qm1Tcm9XeXFXTmd2ZU5iZG9FbWFjTE41U3V1emlMNUptajRCeDBSaEFrL2My?=
 =?utf-8?B?WmpadlRKNnY3Sjl5eDdFb3hLb0NrNzlDZWluNXFJUC9paGVSdVQvaElXY1hJ?=
 =?utf-8?B?aXBqZ1UwN1BaZmtlVFlmS0M1Tk56UlFvMWVYOUJ1enVibmtJY0xvRVRiN2ZU?=
 =?utf-8?B?SFFSMUZKdFZTZFdSNHhzSVppRGVDQVl6OWZmSmFaOWJUQkk0NVpUREJPMmhx?=
 =?utf-8?B?RUR1Y2ttSm9WcEpseVZEeVBWUVVJampSMXhaZm1FaWdaNUkzM2lJWVpmaXZZ?=
 =?utf-8?B?Nm4vN3ZrS3hZNTBQaDhXbC8yUjRXcFFoWkJNQ2MxWTQ4b3NBKzJRdERCczV6?=
 =?utf-8?B?ajEzTnlyaSsvalNuRjVXcm45VW4zRkswTzVIc2tLTGI5OFppeHdBVitNZ3l1?=
 =?utf-8?B?VTJhZWdodUxQbHdLbWpObFVNcXQ4VU16cGYwK2JkRENCWnphbDJ0T01yYjY3?=
 =?utf-8?B?MURjM2pMMkJGdDJUS1JnVXJJVkNWRlpsaEFWYkwzeDk5TkY5Yzh2TXlDM29C?=
 =?utf-8?B?Vnd5a3N6QmVvczZNUkRkSmpmaWkzV2RuSkZyVFQ1QzY2UnhGRCtMRkJlZk1P?=
 =?utf-8?B?enh5MU5jcFZtSThMVXZubFdHVWV4VTM3VW9NSTkvbTdXWlJ2dVhFSmp0QmVh?=
 =?utf-8?B?Z1ZMUjEyU3VCc2RNTzFxRzQvSDJYRVNBVUtJWEwrK3RDZGZRVlFPcGVPQVpC?=
 =?utf-8?B?UGZRdVUvb3hNQUtybERHbjI5eGlJdFpKc2d1SmlscHlmNGhraUF1VjN4WjE0?=
 =?utf-8?B?WXFPdzZoMmxlSUx5UUtwZ3Z6ZTE0QnpIanFBNk4xUWNDajdvNjh0Mi9WanFW?=
 =?utf-8?B?a1RFVU5sN2RwakZvNjUrOWZnMk5OVG02Y0NrTktncldIYWkxWUlxQUJMM0tV?=
 =?utf-8?B?S0VKcVA3QmR4by9mbkd0VmNmVUtwVHV3cWFJamkwNjIxZmZkaDNtcWNQN2Np?=
 =?utf-8?B?ekVTM1FTUFZpTGdFdW1TNjJGem9MdTlucC84Ulk0NU5jRU9uTi9kOHVINHFH?=
 =?utf-8?B?ZExOYnVIbHA4akxKL2xMckJQRW5ENU55OGdidFZ6Qnk0TjdOWDFjRHlWZ3Fo?=
 =?utf-8?B?U2ZMaEJiVFh6dW9EUmNRcXREUnQ3bGhjMjBxOUpJRmQ1enVyNEtsTTZXRHNv?=
 =?utf-8?B?bVVwUmxZWmhuS1hnY1RML1dUZisrbWhvNzVOSXpjODRZQVJyL2N0THpKZGRJ?=
 =?utf-8?B?Q0libUxRWFZxVTJVRlNNZ2Q0NVBOSkVFbkt2VlFuUlRXdjVSbXN4Yi9zZmFK?=
 =?utf-8?B?SVR4QnBqeHpEd1A1SlpWTUFhTkdYRm1GaTZ5UnNPSkdDN1VJNFVJeFJkYmxO?=
 =?utf-8?B?Zlo2TEpMZnhYWkZnR0hPbzllV2tiWnJvS0srbmtNM1pQVTQ4eVNjMWJ2QWVX?=
 =?utf-8?B?NU8rQUl3WHRrdWtNcGxRMFJHSERTdHZCa1cxSy9oNy9kcE0wQ3UzYldmZENE?=
 =?utf-8?B?Y3dlY0VNekxVaHNVMnpZUHYxSHpwTk1LR0FxNDN5OVNqWi81SnlDdERuazZl?=
 =?utf-8?B?SU5MTjVIWGRsL2hrOHdzY3pvejhRbDBha2VLMXBETUtPaWIva0EzVWJOem9i?=
 =?utf-8?Q?z5b8/IJ/CuR9B?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVVhOFhpUld4M05oNWRqR0FiTlZIcExENHQ1VjRtUXlVd3EycDY4b2NHZFVn?=
 =?utf-8?B?Q0xpSlc3dmZoaEtiQnkwMU1iVCtidWdZd3FPYTZhZFI1YS9LVWo4cWtXL3c5?=
 =?utf-8?B?a0dWM3VUQm85aGJ1TmlYcXN2ZzcxRzZpd09hbldaT0d4MjM5RmpMeTZHSjBB?=
 =?utf-8?B?OW5qWmdJMTJRcU1XUVB1UTNISllmSTNJQk9nVjExbTVObmVFVkJOTXBOeUl2?=
 =?utf-8?B?dDF0cndWdnBrZ0NlKzlMTDJwbmozK2JNckI1YnFicFJRS3Z6Q1dBWXk4VWlX?=
 =?utf-8?B?VXNRaEovb2FmNmlCOGdBY3hQdmJTWkJrWE4rdlRUNmFMRER6dVpzaEVheFEv?=
 =?utf-8?B?UDZQdGJzZ09DN3FRck5LUXVNQUhKOWJ0eTVnNHFzRTVpaHdrZkc5UlZvdHhD?=
 =?utf-8?B?aDN0aTBGRmdyS1preVNWMWZCaVJxSUVDRlgzQ3VUTlgweVR0dy9CN3VRWHpn?=
 =?utf-8?B?U0Q4ckxhU01IZkhTbFNJZXVoVERQbFo5QStHYXhoTlNDVno2T2Q3UDJUTXhx?=
 =?utf-8?B?MW1mWFltT09lUDdNa281SE5lRWJEanM0eUNkQTRhZ2VuRm91d3M1SmJYRktS?=
 =?utf-8?B?L1d0ekNSRGVkYWxna2VyamtXUW9SWW5NU1dlbE5CYTdQMm9kdFJCV3FGRjJo?=
 =?utf-8?B?dlRQamRXUGtqZFlDK1AxcFFlNnRhOEZOS0NPVHpmRTZsaEdGb08vRS9XcVVR?=
 =?utf-8?B?b05DVkJla3RpeENHanhKazFtcHpLc0FMYzN4YzEyc1l2ZStnOXZOUXpaWEpP?=
 =?utf-8?B?L28vc2VUSzVWOXAzd0dxU20rbzhRTDVPc0NSZVR0elNkR1lyNFJGL1FKeXdk?=
 =?utf-8?B?UXl1VHloanNCYStLM0gwVzFVY1BWSFprbGQ3c3RaYXJGTnVxMVpiNkN6aDJR?=
 =?utf-8?B?cmxiNTBSZ09qOW53K08yZmlTdFNRUEE5OFMxR3BBUy9LODlYODJRUHVuMkdm?=
 =?utf-8?B?eVlBYTZlVWZvVnEvNWlFeUlucUxJZmVUUUI4ZXd2dU1Ma1llYzlQd2kwL1dq?=
 =?utf-8?B?U2NJcTVLT0NNMFVONUxYK2ZkSmhrUmg3clpMbVRDVGgyaU5KQW16cno5Vm5L?=
 =?utf-8?B?b2dmVXlEN0NJK0JFMXpoNzBJMkpKR2t6UzJzdzNEMDJsWjNvYkViWEttYi83?=
 =?utf-8?B?SkxseXhHODFtQXRTdlpBdHN0NzdzZDlyUU52Zk83bjZJY2tRcGJIa1RWOVp1?=
 =?utf-8?B?MllNa3ZsQVlyZWpVYWRGRkdRK08ya0F4UmhaOXROVi9GNDQ5TUppbllmTlpM?=
 =?utf-8?B?SS9vMkRueEZVbi9aeGVSYm94NU8rOExoeEdHWVBqTDk4NWs1L2R6WmE4RVpv?=
 =?utf-8?B?WTFtWkdJMzVFUXhkTWRPSjBGaHZmV0NNSy93djhUaElMdXRwZ3A5Z1BkSmxo?=
 =?utf-8?B?V3lMQ3ltbFJaRDJHVGRIZzRCeHBZQVA0MHJ3VjhacHlPZWVUN0w4azlpUC9Q?=
 =?utf-8?B?YVF4QWIzWnJaVC9SSGxlQXdXNFFRQ0drR3haRjR4dVhXOGtJajZBQWRlNk1E?=
 =?utf-8?B?SVRKeDZqcVdDaEVxWWpZWDAwNEtqM3FsbmZmWDNTYTVuajBaOEpxVkE4TjZH?=
 =?utf-8?B?KzZYWG5EbllpV1ZWTTBpQmk0dS9yL21aMmdjbEZCcWxhOStReFFYaS9vK2l0?=
 =?utf-8?B?cmRhbkN4YitLYVJtaC9oYUNPOGZ6TlkvK1l5clZyZTNGczQwYXZ5aEpnVHFC?=
 =?utf-8?B?UkFLcG5NbzgydWMvSXQ5dGhtTTJkN2xWK0VuOG1VNFluUFdibUFZTDR4eVlI?=
 =?utf-8?B?QWlLVUg0Y0Jpd2FwV0tmOENLbkVMakxYR21UbCtrRXBscUsvZ0dYM2FFODAy?=
 =?utf-8?B?TDFUajJXbW9QQzJ4bmZYckJ1Uk9iWiswUzBiSTYrMTZHb0Q4N2xZVW8wQWZu?=
 =?utf-8?B?VXZRUTMyU3RiVExCeDNOOXkvVnc1SnZTVTBGdUpNMlRRTldFaTVWc09NT3JC?=
 =?utf-8?B?akdaOS9PRjVISVJuVE4xaWRKU2s1NzJBbFB0TVc0R01VSExVMTBvMkswVTNs?=
 =?utf-8?B?SXh4S2g4Q2k5SGhJK3BYaXVlWVdxcnhQWDAxb2p6ZHdOZmlVWmN6QTFkY1ZZ?=
 =?utf-8?B?SW1OcHZ1TWlReHhSZXZjY0k5eWwvNjhBbXE2cGhRczBsTHk5c09tZ1B3Skpv?=
 =?utf-8?B?K3owcWE5bHZSZmVBL2NJbzFvMkxrazd3ODE3WEdaRDV1MXRwTFloVzVScytJ?=
 =?utf-8?Q?3L/ydrTdPOBEiPMsg+pCPxkHaE93PQZUiQ0Sipgr+dQF?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4120877-b380-445d-287d-08dc9766193c
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 11:33:14.6716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KWpWhmttRAV0XrqOJLX1miQMC6DfvrPU0lW/4ccXLjD1gv1+3LWkoUt3peEh/hlvnwXohxtgrT4y+Vg+v+ruBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEYP281MB4460
X-TM-AS-ERS: 40.93.78.49-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1026-28488.001
X-TMASE-Result: 10--28.888200-4.000000
X-TMASE-MatchedRID: pS5owHKhBO35ETspAEX/ngw4DIWv1jSVbU+XbFYs1xK3UJJ8+n/4RdDF
	H3Wq0Hei8/CUaSFEolDtIrpZrVLcYZ5mTKF4TLatoSymbNaqh68JMPex6G5f2r2L79/20sYbTAL
	CCJPLAA3SZRaS3C7tNYh+byAceuT1Z6/n0AY7xPQHNShWtYdI6eV9Tt4ma042Ui9TYaqpz0x1zo
	CkuKv3zbiK0dSKauyzQ1CD2mRS3R5YTuGFcYJ4hgn3zfRJfTcDAYrC4DsFSccdsA6+8hSIIWCmv
	oYG1wln44tQpHELQKRV5JR1kTmgYtdCzQqc1lNW+D1d5hAWlOI7GoGr6+PiiUa2BVGqYXs2292N
	nW1H/iHubOjYjWcZRjnMduOIb1Jipo9QVV7F6tpJF1UGj9ejec7P4JpFsMVwWB/DYwvfuLVLqVR
	s6RktuvTEeulZfYMY/qQKNCQv7dKgqCBzFejhV17l57ki0S38Y3ZcLJE+C13vkm4s/anM1a1Ar1
	ud+VUVP+yPtPPylyxLP8voR8Wz+EwBo2eYZQcCZhL02vM2qdpcRfsAGgyyDbG53EQ9QCTJ4XW4n
	QxObKFdExq5OlYtNiVOh4fIkrxLS+rxvINMBniK7q7iyFn58SsZXvcCxTRn2is2Jndz3Mql3XIh
	gaMT15AffJV9H6QnB40vC5e0FmTCC8z82WqP7h10V8fYzFsltDU+oZYcXHLIEVw/tNyThJZgyty
	iNu2qhYNEGrSdk3g6uXasi6hiM+i1lkUvOtVfawJUqbmGPB3aPuPIIqmcJ/p4OuSy0UFxr54JIx
	46I6QD+Uf8y92iJhk2bH+n0MonJ3n9e/k5m85WFOy8XosOhlmur05CscKykGUtrowrXLg=
X-TMASE-XGENCLOUD: f67504d5-09dd-436f-b3a6-68c0a8cb7343-0-0-200-0
X-TM-Deliver-Signature: D7EB6D0DA891D0624815F436CEBAA951
X-TM-Addin-Auth: 6/D3UD1WVEQyLZmbbwxcoYXDl+j9zjhdRV4PAGJeOrH5PaWsaqumzhal38Q
	Yijg0ZgQ1NWjIL+zv/w7O1Ir94gZoMCL40UluMx1YURGckvtV8RfjTjy33yAaBeGqHaEM9CDtmk
	aNqatiTdQUHEH1t7tPJoPP6Gu6mwoqurMaFm1wrTx/BkvOLRuj0B0d0GSuIo1t2ZCF3bNpDUken
	HaxjImu2ikReOZ4JMJuISdb+6ffpd/z6j2WAfs/7vuyJHjdELBC++EVAFXzNanNChF6b/3og/0C
	quj8d7qV9CLcCWM=.YjyxDRXYf7KN7WF86EFkzs3jXBCJoHHG48l/AtZ0rl9ckf5s4YStuMf6dn
	8urZWdA6mW98My2CXwcuovrWcTNqKm0mI15G8KqxipYkqmogSIvoO2EHoaTR4lEhZKrndms33l6
	W382zzVgcGdL9pxQ0o35q8/Lz095CW27eaETIciLrkclkMlOf+Rbnj08k+YgjKf05WumtS2rtTr
	wOvdT+o/041emP3JNZhZuVOo5XfYNKvveEDEMCV+2DvnRD47xV0zDVwpcOjI7mBCDlSRbS7biA+
	kmOu4yJvcabeJYAjxVDju0dWo/C8nd/ta/0/Ntzisw5up+ROpRF8olHCQdQ==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1719574396;
	bh=3as4jp5BhbwzLG8fMmHzyxB1i67IM4F3A+Ckd3sdb4I=; l=9582;
	h=Date:From:To;
	b=mJMaK5gpENA7/yztc/wGg7CSnLDTRzVax8a9UafnRLFtOlScu0kS0XtLiegsjKKRa
	 Y3r9ixHB3lhPz2CWXpg8wZVlYL+Lie8SKAS+EQ5e7RqhtiBY+P2BdqKV0x7G+Xy8+t
	 a4Xgwx9tp4orDrd5jn5zTsyCPDYjppEZ3hYcrpE4gDGjVE7VbmsR4aLuJxHMETb8QJ
	 hRqYmrckgM0kyhzeXk6xNPCVFJWwApkAzDC5LAWlH7XQkFE+5rDJyuj6RknNTiP9Nb
	 vss/nBvafkkqS4176Z7UlBHD3e3qOsHnTWR630CfGBSWyi58+tjffsjs5xMaZFm/XC
	 w2adZdrcOToTg==

On 27.06.24 16:52, David Woodhouse wrote:
> On Thu, 2024-06-27 at 15:50 +0200, Peter Hilber wrote:
>> On 25.06.24 21:01, David Woodhouse wrote:
>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>
>>> The vmclock "device" provides a shared memory region with precision clock
>>> information. By using shared memory, it is safe across Live Migration.
>>>
>>> Like the KVM PTP clock, this can convert TSC-based cross timestamps into
>>> KVM clock values. Unlike the KVM PTP clock, it does so only when such is
>>> actually helpful.
>>>
>>> The memory region of the device is also exposed to userspace so it can be
>>> read or memory mapped by application which need reliable notification of
>>> clock disruptions.
>>>
>>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>>> ---
>>>
>>> v2: 
>>>  • Add gettimex64() support
>>>  • Convert TSC values to KVM clock when appropriate
>>>  • Require int128 support
>>>  • Add counter_period_shift 
>>>  • Add timeout when seq_count is invalid
>>>  • Add flags field
>>>  • Better comments in vmclock ABI structure
>>>  • Explicitly forbid smearing (as clock rates would need to change)
>>
>> Leap second smearing information could still be conveyed through the
>> vmclock_abi. AFAIU, to cover the popular smearing variants, it should be
>> enough to indicate whether the driver should apply linear or cosine
>> smearing, and the start time and end time.
> 
> Yes. The clock information actually conveyed through the {counter,
> time, rate} tuple should never be smeared, and should only ever be UTC.
> 
> But we could provide a hint to the guest operating system about what
> type of smearing to perform, *if* it chooses to offer a clock other
> than the standard CLOCK_REALTIME to its users.
> 
> I already added a flags field, so this might look something like:
> 
>         /*
>          * Smearing flags. The UTC clock exposed through this structure
>          * is only ever true UTC, but a guest operating system may
>          * choose to offer a monotonic smeared clock to its users. This
>          * merely offers a hint about what kind of smearing to perform,
>          * for consistency with systems in the nearby environment.
>          */
> #define VMCLOCK_FLAGS_SMEAR_UTC_SLS (1<<5) /* draft-kuhn-leapsecond-00.txt */
> 
> 
> (UTC-SLS is probably a bad example but are there formal definitions for
> anything else?)
> 
> 

I think it could also be more generic, like flags for linear smearing,
cosine smearing(?), and smear_start_sec and smear_end_sec fields (relative
to the leap second start). That could also represent UTC-SLS, and
noon-to-noon, and it would be well-defined.

This should reduce the likelihood that the guest doesn't know the smearing
variant.


[...]

>>> diff --git a/include/uapi/linux/vmclock.h b/include/uapi/linux/vmclock.h
>>> new file mode 100644
>>> index 000000000000..cf0f22205e79
>>> --- /dev/null
>>> +++ b/include/uapi/linux/vmclock.h
>>> @@ -0,0 +1,138 @@
>>> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-2-Clause) */
>>> +
>>> +/*
>>> + * This structure provides a vDSO-style clock to VM guests, exposing the
>>> + * relationship (or lack thereof) between the CPU clock (TSC, timebase, arch
>>> + * counter, etc.) and real time. It is designed to address the problem of
>>> + * live migration, which other clock enlightenments do not.
>>> + *
>>> + * When a guest is live migrated, this affects the clock in two ways.
>>> + *
>>> + * First, even between identical hosts the actual frequency of the underlying
>>> + * counter will change within the tolerances of its specification (typically
>>> + * ±50PPM, or 4 seconds a day). The frequency also varies over time on the
>>> + * same host, but can be tracked by NTP as it generally varies slowly. With
>>> + * live migration there is a step change in the frequency, with no warning.
>>> + *
>>> + * Second, there may be a step change in the value of the counter itself, as
>>> + * its accuracy is limited by the precision of the NTP synchronization on the
>>> + * source and destination hosts.
>>> + *
>>> + * So any calibration (NTP, PTP, etc.) which the guest has done on the source
>>> + * host before migration is invalid, and needs to be redone on the new host.
>>> + *
>>> + * In its most basic mode, this structure provides only an indication to the
>>> + * guest that live migration has occurred. This allows the guest to know that
>>> + * its clock is invalid and take remedial action. For applications that need
>>> + * reliable accurate timestamps (e.g. distributed databases), the structure
>>> + * can be mapped all the way to userspace. This allows the application to see
>>> + * directly for itself that the clock is disrupted and take appropriate
>>> + * action, even when using a vDSO-style method to get the time instead of a
>>> + * system call.
>>> + *
>>> + * In its more advanced mode. this structure can also be used to expose the
>>> + * precise relationship of the CPU counter to real time, as calibrated by the
>>> + * host. This means that userspace applications can have accurate time
>>> + * immediately after live migration, rather than having to pause operations
>>> + * and wait for NTP to recover. This mode does, of course, rely on the
>>> + * counter being reliable and consistent across CPUs.
>>> + *
>>> + * Note that this must be true UTC, never with smeared leap seconds. If a
>>> + * guest wishes to construct a smeared clock, it can do so. Presenting a
>>> + * smeared clock through this interface would be problematic because it
>>> + * actually messes with the apparent counter *period*. A linear smearing
>>> + * of 1 ms per second would effectively tweak the counter period by 1000PPM
>>> + * at the start/end of the smearing period, while a sinusoidal smear would
>>> + * basically be impossible to represent.
>>
>> Clock types other than UTC could also be supported: TAI, monotonic.
> 
> This exposes both TAI *and* UTC, by exposing the TAI offset. Or it can
> expose UTC only, without the TAI offset if that's unknown.
> 
> Should we also have a mode for exposing TAI only, for when TAI is known
> but not the offset from UTC? Is that really a likely scenario? Isn't a
> host much more likely to know UTC and *not* the TAI offset?
> 
> I suppose if we have *hardware* implementations of this, they could be
> based on an atomic clock and all they'll have is TAI? So OK, maybe that
> makes sense?
> 
> (We'd have to add something like the ART as the counter to pair with
> over an actual PCI bus, of course.)
> 
> We can add a type field like the one you have for virtio-rtc, yes?
> 
> 

Ack.

>>
>>> + */
>>> +
>>> +#ifndef __VMCLOCK_H__
>>> +#define __VMCLOCK_H__
>>> +
>>> +#ifdef __KERNEL
>>> +#include <linux/types.h>
>>> +#else
>>> +#include <stdint.h>
>>> +#endif
>>> +
>>> +struct vmclock_abi {
>>> +       uint32_t magic;
>>> +#define VMCLOCK_MAGIC  0x4b4c4356 /* "VCLK" */
>>> +       uint16_t size;          /* Size of page containing this structure */
>>> +       uint16_t version;       /* 1 */
>>> +
>>> +       /* Sequence lock. Low bit means an update is in progress. */
>>> +       uint64_t seq_count;
>>> +
>>> +       /*
>>> +        * This field changes to another non-repeating value when the CPU
>>> +        * counter is disrupted, for example on live migration.
>>> +        */
>>> +       uint64_t disruption_marker;
>>
>> The field could also change when the clock is stepped (leap seconds
>> excepted), or when the clock frequency is slewed.
> 
> I'm not sure. The concept of the disruption marker is that it tells the
> guest to throw away any calibration of the counter that the guest has
> done for *itself* (with NTP, other PTP devices, etc.).
> 
> One mode for this device would be not to populate the clock fields at
> all, but *only* to signal disruption when it occurs. So the guest can
> abort transactions until it's resynced its clocks (to avoid incurring
> fines if breaking databases, etc.).
> 
> Exposing the host timekeeping through the structure means that the
> migrated guest can keep working because it can trust the timekeeping
> performed by the (new) host and exposed to it.
> 
> If the counter is actually varying in frequency over time, and the host
> is slewing the clock frequency that it reports, that *isn't* a step
> change and doesn't mean that the guest should throw away any
> calibration that it's been doing for itself. One hopes that the guest
> would have detected the *same* frequency change, and be adapting for
> itself. So I don't think that should indicate a disruption.
> 
> I think the same is even true if the clock is stepped by the host. The
> actual *counter* hasn't changed, so the guest is better off ignoring
> the vacillating host and continuing to derive its idea of time from the
> hardware counter itself, as calibrated against some external NTP/PTP
> sources. Surely we actively *don't* to tell the guest to throw its own
> calibrations away, in this case?

In case the guest is also considering other time sources, it might indeed
not be a good idea to mix host clock changes into the hardware counter
disruption marker.

But if the vmclock is the authoritative source of time, it can still be
helpful to know about such changes, maybe through another marker.

