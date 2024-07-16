Return-Path: <linux-rtc+bounces-1525-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 620D8932751
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 15:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17FB8282A50
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 13:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81EF119AD6A;
	Tue, 16 Jul 2024 13:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="cA9G9k/5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from refb02.tmes.trendmicro.eu (refb02.tmes.trendmicro.eu [18.185.115.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9CA19AD4D
	for <linux-rtc@vger.kernel.org>; Tue, 16 Jul 2024 13:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721136058; cv=fail; b=PeBo3vLwIx+o40oLvD8hPvLASPkcv8dHrv9D6kOygZC7TiCJlrrZ/BrSHiiBFv6PbTrwznnuW1W0ct6bW9C4yRnObMop0H+4ycAvGAewwNDKDACv6xZPyS/0+HMN+FDu60/4m9d2xCnfOnh3bEiZLdk671xbPf1Tiilx5L+c0Gs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721136058; c=relaxed/simple;
	bh=scAJbgVh6T4+FH6eMi+Z+RzbLC/TSm4nVDoTq3f0Kpo=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F5I6kFsfDJlE61ElajnFIT15SONqHEmcShjlvCMTPuxl1GCChJbg8Z1K22fQYKUPgNvGNWDbJKwoucn9TI/0aLHHnk3jkpzFlyZqaTiggpvYCFqJgMxt4UkYLitcBZGFGZ1G6aP+8PisEf2o/b4TaKJm3KGuZRR76YUDb6gJsP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=cA9G9k/5; arc=fail smtp.client-ip=18.185.115.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Received: from 40.93.78.49_.trendmicro.com (unknown [172.21.9.37])
	by refb02.tmes.trendmicro.eu (Postfix) with ESMTPS id B1065100F7148;
	Tue, 16 Jul 2024 13:20:49 +0000 (UTC)
Received: from 40.93.78.49_.trendmicro.com (unknown [172.21.173.61])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 31AAF100014C7;
	Tue, 16 Jul 2024 13:20:42 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1721136040.582000
X-TM-MAIL-UUID: 3880b2b9-0cc1-41c0-9e1c-565d091236b8
Received: from FR4P281CU032.outbound.protection.outlook.com (unknown [40.93.78.49])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 8E594100003D1;
	Tue, 16 Jul 2024 13:20:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dv1ICR+9EQ+hGhm6xm28Y2Ir33orvkoTVGs9oc/x00V66i8X8UcrzoTygFLHFtm0aKIrHAqOYBMeOepR6T5sE7kk0400u04lRyG1SNUauApU1mPnG2wpO/XFdXUw2VOpXBVef+F8eecrTocgri1hZjLFzKlCvX273Ny7KiX96y6MnJONU5zgec6e5OP2sGRNQLP3fZuQAt1bqtLrHpFTtsIUTv7mB8oLuYzJc5JExmoyaNUzUPJzQItsFRR1bcPVRi5XYTL26b61kmJ21HWaMFkVM67tZfoC5q8r9Emwdv0pbdl08aMMK0qAuWhj1LURDMGbW2K/YAPzBOn7XAw6RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3nyCsIRBsehbMbSusgXSQoxEnRZAfAHpp2U966/u/M=;
 b=x9VEmcxlEl3v6p61pzdyrz/nx4TyNlrdlHmNVlmQcqHUsJKXuLZaaMkg4xAh6Y3IZEInf+L4DWI6022qMHzRWFJNbLY2O7ZjtuhGOsTDelqfk8QYCsQFI9xIaJi5st07piDsg5PmZIEduopHorShNRZbICOUHjELl0vit4yMt+EITFiziFNYd36kUAwSMaP+zRz8u6KPDOyk2d6VzFVhY84I1BjZe4Ski11ezH+1I2VYUQkZ1VjTPK8vSdl1VRKmIGtOX5ULb+P8+wLSpnOwlADUFogef76/SjeuaNkrnVWnPvU96KPSDDGJa9k2elFrUWV4zOEeVQ111YCW1w70eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <10db46e9-b753-43bb-a826-14d4c11026bd@opensynergy.com>
Date: Tue, 16 Jul 2024 15:20:37 +0200
From: Peter Hilber <peter.hilber@opensynergy.com>
Subject: Re: [RFC PATCH v4] ptp: Add vDSO-style vmclock support
To: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, "Ridoux, Julien" <ridouxj@amazon.com>,
 virtio-dev@lists.linux.dev, "Luu, Ryan" <rluu@amazon.com>,
 "Chashper, David" <chashper@amazon.com>
Cc: "Christopher S . Hall" <christopher.s.hall@intel.com>,
 Jason Wang <jasowang@redhat.com>, John Stultz <jstultz@google.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 qemu-devel <qemu-devel@nongnu.org>, Simon Horman <horms@kernel.org>
References: <20240708092924.1473461-1-dwmw2@infradead.org>
 <060f392c-7ba9-4ff6-be82-c64f542abaa1@opensynergy.com>
 <98b20feebf4e7a11870dca725c03ee4e411b1aa3.camel@infradead.org>
 <1c24e450-5180-46c2-8892-b10709a881e5@opensynergy.com>
 <1ca48fb47723ed16f860611ac230ded7a1ca07f1.camel@infradead.org>
 <9f132922-2bf7-4749-b8c7-4c57445f9cde@opensynergy.com>
 <DD886A0D-B8E2-4749-AB21-7B26A4B70374@infradead.org>
Content-Language: en-US
In-Reply-To: <DD886A0D-B8E2-4749-AB21-7B26A4B70374@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::11) To BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:3d::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB1906:EE_|FR4P281MB4208:EE_
X-MS-Office365-Filtering-Correlation-Id: 198f1568-ca8b-4cd9-d182-08dca59a15ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dFFSbmtDT0xTZC9WdTg4cXphelozM3dmOGhNakRsVm1lZFFqWFJoWGFpMEVW?=
 =?utf-8?B?Wm5uTndITlRNaXR0WS9Wd1p0UlVycnM2TGVVblJ0WExiM0M5Z2c2QlZEWGhE?=
 =?utf-8?B?UGtzTU5aaWVUUWNma3cvWUY4c3ZtdjFENzk5Rjd6cmtNa3lFUmN0WGFmVm9H?=
 =?utf-8?B?b2VlcEJhczdFOWF0Q1RLNm03R0ZYN0UxdTAySFNUN2xDWVpuVzBKNDFadkdm?=
 =?utf-8?B?SGU0Y3ZxeEdrc1RyRmlvNEVIWVpPL2NIV2JkeWZ3VE5KWEE3VDMvaE11YmFH?=
 =?utf-8?B?STRpTDdQUDhsMDhhRkw0bnJBOG9kSnA5enNZaktuYUhWZkovMUU4emhtQnpv?=
 =?utf-8?B?Q05QTjBCOTc0Z1JhR0RBaVdSN0N1ZEErQ0FKeEVHZ3ZGTEYvVHhEUktuaDJu?=
 =?utf-8?B?bnVDK2RubDBHZ0Y0VFN5TzRhVmlxUjhPenc2Zjk2eG1OM1lXNFR3YllTckxJ?=
 =?utf-8?B?T1l2Q3A2UTVVcUxjZjY5TE5vOWhoL0w0c1dIWkRTVWJIdDh5VHo4UzlkbDJQ?=
 =?utf-8?B?OXdUZEpuRUFLa1NrMWFyOE1jclR6MjQzbHpXZ09DZmtVMU8wY0M0a0s0WkJK?=
 =?utf-8?B?WXoxVFF2S29CdWVlVW1MWWdTUXppaHgyVVdhc1FiZkE4WGRldCtlU0dVUHN3?=
 =?utf-8?B?WWpqNEF5TWVteDdwYmsvd0RKb1d2TERzQ1VHRVJWb2pZaHUrckJ0dCtBUWZC?=
 =?utf-8?B?ZHkyaXQzWHh4RUloVXl3S1lFNVRuVHhXZk0xdXNRNVNiMzhhUWphNjUwRkFs?=
 =?utf-8?B?bFBtTjA4eVIwQld4OTF4RnRHTDhsaUZTZkpuS2hNQ3ZSNTFPZzZ4Nzh4cnlm?=
 =?utf-8?B?Y24rQVhLVHhOazd2OWtMQlg5ZUc5Y3JSS2Q3S1E2RHR6MGVDbXpmdXphdG4x?=
 =?utf-8?B?b09BRHFSRXVBT01uL0lIOVBXYmRXaUg1c0ZlSjlHY0xLZnVZWkhCYVJKa2xa?=
 =?utf-8?B?YTRJMXIyMXBob0tBUVhXSzl5VmRycWN0VUU2YjIvUUVFcWRod1pkL0tPcWhr?=
 =?utf-8?B?K1pzSitrVkNCOGwxNjZQV015NkxYS1FHM2UxWTdqVGorQ2pjLyt2bThlTm0v?=
 =?utf-8?B?elVsVURYT3I4NlRIMmI0QnpDVzl4cUpqb0tMc2FFaVZHNG1HTi9yK1hnSVpa?=
 =?utf-8?B?UDJYL0ZNMzZHcW5YZ3pDMnVBbk5ueU9hVWxMNGlmcm5kcnpTeVlpNFFCUitN?=
 =?utf-8?B?MmRObE9Gd3ZMREk3TDR3U1hwTklMM050cGUyY1lVNGdZZFRCMC9XdTVtMG5r?=
 =?utf-8?B?WDNBdVRLb1ZqUWllZndadUFEWm03VCsycEtoRFQxTGdaSzQvNDJVUkpUM2F1?=
 =?utf-8?B?UzJEN2kydEZJbGpNWFNyUHhnWUpaNUhvbVFaNEV4cE1SM3dmTC84RVpvTkJW?=
 =?utf-8?B?cHBaeTc2WldGNzJudmhCNDhFTlVkZ3RTR05UTkhyMks2L2orVEFEbG85TUhQ?=
 =?utf-8?B?aVBDaTYzSlNIZThYanIrUEZSbWFxUzdpZkdTbjhYZ04xaWJncWlIUW5DQjho?=
 =?utf-8?B?QUI3MmxhbWwwakt5a1ZzOW1INXRZb2FOZ3MzbHBkSlpRemQ4c2QzV1g3Y2ZE?=
 =?utf-8?B?YU1CTjJGcHlRdGtOYTAyY0ozYXo0TzlHblZLY041M3FEcCtDNENkVEZiYnl4?=
 =?utf-8?B?c0Y2VURHRjU2RWF2RmFvY1pkSG9rUnJiMFovdTQ5aCtoSUlCQmYrMjh5UmNI?=
 =?utf-8?B?bitCeFR6cFhiaVVGVXBnSkx6QmdPU1FqVXZQRnBEazE5VWt1ckpjUzg4Qk5k?=
 =?utf-8?B?UHYxc0w2aDkyK004N2M3RkZOcEx2U0ZlcEV1dXZ1OTZIM3ZCejZkdnhYeDZY?=
 =?utf-8?B?RTBQK2liRStkZm5QY0REUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHhoWjN4U210dW9BS2FrdkZOaktGcXRWWW9KRUJEa0kvNHVDeGRTUmtGcVFh?=
 =?utf-8?B?UjducDZ5Vy92QjNYODZxaXRXU3hLQ1JEb1FQZW9QU1hzdE9QdXVCRmI5THJK?=
 =?utf-8?B?bmtKR1BraGt6Y2FTRlpiL3hkRmUvajRvSG9DL0NpRndCNE5xcXFuSUthN2g4?=
 =?utf-8?B?aTZhcTFKbWFkVnJVVTdBOHA1S1UyWVE2dmRJZ0JyRHNSanBnL0kzRzB6MW8v?=
 =?utf-8?B?ekJaRXI4SHFDcEpUR1lPSWoxZmhEV25LSkpSalhGQzUvbERDUXAwTnZVSlRV?=
 =?utf-8?B?ZkQzNGdNOGQweDZRSmpiYmlrVStMWXdEY3dLS21jRHJBaWJQTjhOblBlTjd6?=
 =?utf-8?B?bnhaaGpTakwxZ3JpRGpEQnhLdUNLZ2o1aEo1bXhIR2ZuSnNwYU85UGI4bExD?=
 =?utf-8?B?Mkp4QjQ2OXRHczNXTkp1U096bVA5QUM2NUpzVWtUMEhOcEFPcGV4UE9VUUpV?=
 =?utf-8?B?S0RSSFJnMUEwa0Y2R2ZyNGZ2OHgxUFVpWER1V2V1T0xwNHlYalhXaXdETDAx?=
 =?utf-8?B?eEk4ZlI1eTVJZWZpSWFRalpPdlBCY1VKeWpUcnlSRmpva2V3Si8zTFMxYlF6?=
 =?utf-8?B?QUtRYnU5SXlTb3k4SVA1Y01ER211TDRlT0ZENFVRN3d2UmxPODA2ZWR5V1Q3?=
 =?utf-8?B?YWhRRi9NWWo3eU5DU1hET05iaVpvTzFJZFBEaTVVaXk5ZEVRUG9mRExuREtw?=
 =?utf-8?B?ekdBeGVMeGk1V0lrbk4xQTI2WFJzMGJLc2sxaEczVld0MHZGQ3RyMFBydGZY?=
 =?utf-8?B?TUZpb0p6OEJQcnFtRFNZUEMrN09IZjV6SzZ6VFVuOHM1Y3JLODNHMmZ6d2g4?=
 =?utf-8?B?RzZQZTlqQWVVaEtMbXVYclNISVB6b0k0RGhhZTdZMDZFNzR3ZlZrY1FYVDRP?=
 =?utf-8?B?Nlc1akhVL1dQSndhT0lwcmR1VWJlbDBpWDA0NmxNV0k4U0h3RWJ4RldvNkto?=
 =?utf-8?B?TmtLTUFXWlNPQms3ZGhrT0Y2eTh0Z2gzNDJRRTkvbE9weHZxUGNxN3A0aW1h?=
 =?utf-8?B?RzJYVFBzUzNieEROM2hlT1lhZ0hGWmc4OEI1Snd3QkRNTld6dFFJRDdmTVJz?=
 =?utf-8?B?bUhZbnpuckpJMThVT1kyY3BDSlJnMFNLR0krUldMK0hBVWxHQm9tR29LQ0sv?=
 =?utf-8?B?NEJjYU1nZGtnYW9ZMVlJNjlLLzRGTXZtaU9EWXRyZUFnaWZXc292Nk05akNn?=
 =?utf-8?B?d2g4ZXRyOUFrTGkyRmUweTRuOWxqTGlScit0Q2JxdXlhR3ZRUTZFRVVwQzVH?=
 =?utf-8?B?T2tKNEZ6MjJrQkdUQjc5RWdEWnJUMlhWS1kybzcwbnNPWXA1UHArUGRCRmJa?=
 =?utf-8?B?NWp1UXcycEJFRGZSWXEwRU43WXdoeFBRbDBzenhua1JSd29McGovcnkwbVRB?=
 =?utf-8?B?THQ2U1ZpOTNPQjMwdUt1cDVhSVZ4bnVxZCtPZ1R1UlpNSHZFU1AyNlh4allk?=
 =?utf-8?B?N0VNVW9FbmtBVTh6M3QwWnhnYUFHTmkvNXdNRUw1bWFhVGJKZWdKSU9paENN?=
 =?utf-8?B?VGEvZVp2QldDZWdVTEY2eWYzbUptdndtVmxPRitJMlJqVk1lNFQwTUR2b1NG?=
 =?utf-8?B?cG84L2tHRzd0NFIxb2RkUWZKOFNyVGQxdjdIMUlrdnNEQlU2WHlYU3phMzNJ?=
 =?utf-8?B?a3ZCeEt0cTc4bjlOZjNSRkJjbkdZTElvbjVTVjA0djV2ejA4U3pNK1BEQ2th?=
 =?utf-8?B?aTV2V083Vm1kVlVnTFh0UlhLWHkxb201ZmtCSklEM0MySS9CSWNSWFNCcVhZ?=
 =?utf-8?B?VWZPRERTWHNyNFVmc2pLQ28vRElkUUhsTXdPRENqMkpiQXpObS9pOG1DWXQ2?=
 =?utf-8?B?NTJxVUFGdjdrSXBUSGVid1hoVlU1VGF2SG9vY0hXZUxOSUU3Vm1sM2lzazBU?=
 =?utf-8?B?TVhENVcxWjZnc0gwSVZkNms5WUVRTURCcVAyQ0c5VUZ3UVBwbGtkZWVuVmpB?=
 =?utf-8?B?SVN4aEJlRWNBNXVkYy9jV3dwNzB3N29CYnM3dFJDVktzeGFTMUVBWGtNdjRy?=
 =?utf-8?B?VFJ6MzZvZ1dKNUY5cm9XRE1lbnVRbFVxZVlmUUF2QWtydFZBSHF2di9UbnRE?=
 =?utf-8?B?SUVJSUZvaU0xL0hSRkhzNy9hTTIyTFhKZTZYajJvWDhhd3EwcDMva01PcERl?=
 =?utf-8?B?NlY3b3lCVHVTL3FRZ2tGQnNySVhrSGplVHpGa0YraUVTR3dZTTA2Y0RCVnlW?=
 =?utf-8?Q?6Q9n0YZr3Mzvp0UCtRHBZyRa1I+uuEtP81rkZCJuO15Z?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 198f1568-ca8b-4cd9-d182-08dca59a15ac
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 13:20:38.8017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6M3hujQftAFDZdBP2On4N+r0+if0kR6BdHdS2MWW4OjwUUpI+0jkDQFp1UGIwJ6CdTPvnsrZ21qwKcqcQScpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR4P281MB4208
X-TM-AS-ERS: 40.93.78.49-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1026-28532.005
X-TMASE-Result: 10--18.514500-4.000000
X-TMASE-MatchedRID: X4bcv0S75Kn5ETspAEX/ngw4DIWv1jSVbU+XbFYs1xIhkL0gCMh6Dsig
	HKaC3ZDJADKNkHTrGGc4AS+kYyrrEcd2HSheDtk3eJchdZcr1K2vfe6AKVPc3pGeN+9dVIq3YXc
	dG5rihMXLjprZcXPZwOFsZGt1Klu61geCRZ1F9LQKonRFsndtvUb3ed6yowduRLCxdbGDxWrErb
	l4/evtZNGuZq+LiOD3p+fNEmMhWtjYT6uZOaIN0x+1m4xl+bZJIyQ2IZ1g8ybGWwYDp5NIUuMhy
	XW0ThjcRX5VaQhLt8pJvs8/NAI9NeCc2N46uxVRpJgUXPcinGTJ+MXwxLqnFUFGZQj4DiD8hes1
	L7EqVuqxA7pVyH8J9tXNOAQ2MSi2muMpo5XKw29WPx536TZMQBomt7e+ksQhJpK4F9wnIiY7AFc
	zfjr/7J/jCfQBNNj4Ijj+VBDm5y749tOn7ULKeU9g/VrpVC3a+nI6agRjOOQ=
X-TMASE-XGENCLOUD: 24220c83-df75-4635-af70-ce9b1ab66bb6-0-0-200-0
X-TM-Deliver-Signature: B4AE5B39AE630974A4886E35AA9EEC28
X-TM-Addin-Auth: 8kPkiYCYIO0VxXUm5tc8W/6i7g/XDo/1/TkWt7dkfl4GNOS6I8kpKl/k6Q3
	6bGPVZMYbaKSXndquQzKFxee5xWFGZPmTDbdnTEAX5LJlP4mCPDyTEvJiEBWS4EiGxreOyFgcik
	8oPfFUainTiwvGVR4/HXCtpmGIWyYOXroVyxRe9Ba+WpzmerEVZDsSx9kWyLgD2TBEvTKK1YNPa
	WyvoAl0m1X/91jrik2azubPhGJol2P++7GFIqhPe9h/ZuZrRBqZOUGH52mXdY2XQ2kRW2Zd07/u
	KhdUUQRtHxhJsmE=.ZF3NUxe/RDHPoS+PuDYA67U/6v8wKBrNzCtqhfFKr0syKrDpc5pythItA5
	EKEQFqNMvdJgbG1Lq3S8x/p1dP6Cory24/6TRHPgEYHFAkHISteHA4wRZ4ieXtf2mcrsCK5YOK6
	6wHbjuCD1RNSLvrTFY9pTVz6/D0tzaclBUdOT+qYZ+P6LVLs9W2dvlt7G2N7uUch59su/TT+4eB
	7KQCGzEZ17fQSIRNau3TzrBEo3dPbQOPd/PjduDl8nbQLo2MZu2Hgg2GGOLRw7Sxd4JO7yzfMkr
	KxV9KzwX0vT4tqFl7bo3QnUlf4y4EQVRevQa2IpP/O3L7Hvpy0w1hB9k8pw==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1721136042;
	bh=scAJbgVh6T4+FH6eMi+Z+RzbLC/TSm4nVDoTq3f0Kpo=; l=2548;
	h=Date:From:To;
	b=cA9G9k/5ZjumY9aIHHQoOFmDNjcdw8z/Z1t3C1AcW75U2Syh6Xg2tdSSbKUQh4I5f
	 FY2bEFm/Pp9DQnCKlg4hbrofZr9NPuLppTEHbSBekhk+10oBE6bAG7yc3QaSZX34GU
	 8iUwo0VZGSyBUJqU4ikJMue3HdNhXYH2Rl8lfPpPEkxLPVQXX17a07eYF+cfl5VlR8
	 ye8NdUwW/Ly/Sj1z76rjEt8pYIN1uXFR4K9ytuW2UVp98NDPChreSArwM/oadadLFm
	 uXWBHaVZ3paL8PEm7sDOUtSSP9v3zQTmRFmAsl41nsE18nJhmfI/jq9sVsa6E0Hm4z
	 F9g45PKT1GWYQ==

On 16.07.24 14:32, David Woodhouse wrote:
> On 16 July 2024 12:54:52 BST, Peter Hilber <peter.hilber@opensynergy.com> wrote:
>> On 11.07.24 09:50, David Woodhouse wrote:
>>> On Thu, 2024-07-11 at 09:25 +0200, Peter Hilber wrote:
>>>>
>>>> IMHO this phrasing is better, since it directly refers to the state of the
>>>> structure.
>>>
>>> Thanks. I'll update it.
>>>
>>>> AFAIU if there would be abnormal delays in store buffers, causing some
>>>> driver to still see the old clock for some time, the monotonicity could be
>>>> violated:
>>>>
>>>> 1. device writes new, much slower clock to store buffer
>>>> 2. some time passes
>>>> 3. driver reads old, much faster clock
>>>> 4. device writes store buffer to cache
>>>> 5. driver reads new, much slower clock
>>>>
>>>> But I hope such delays do not occur.
>>>
>>> For the case of the hypervisor←→guest interface this should be handled
>>> by the use of memory barriers and the seqcount lock.
>>>
>>> The guest driver reads the seqcount, performs a read memory barrier,
>>> then reads the contents of the structure. Then performs *another* read
>>> memory barrier, and checks the seqcount hasn't changed:
>>> https://git.infradead.org/?p=users/dwmw2/linux.git;a=blob;f=drivers/ptp/ptp_vmclock.c;hb=vmclock#l351
>>>
>>> The converse happens with write barriers on the hypervisor side:
>>> https://git.infradead.org/?p=users/dwmw2/qemu.git;a=blob;f=hw/acpi/vmclock.c;hb=vmclock#l68
>>
>> My point is that, looking at the above steps 1. - 5.:
>>
>> 3. read HW counter, smp_rmb, read seqcount
>> 4. store seqcount, smp_wmb, stores, smp_wmb, store seqcount become effective
>> 5. read seqcount, smp_rmb, read HW counter
>>
>> AFAIU this would still be a theoretical problem suggesting the use of
>> stronger barriers.
> 
> This seems like a bug on the guest side. The HW counter needs to be read *within* the (paired, matching) seqcount reads, not before or after.
> 
> 

There would be paired reads:

1. device writes new, much slower clock to store buffer
2. some time passes
3. read seqcount, smp_rmb, ..., read HW counter, smp_rmb, read seqcount
4. store seqcount, smp_wmb, stores, smp_wmb, store seqcount all become
   effective only now
5. read seqcount, smp_rmb, read HW counter, ..., smp_rmb, read seqcount

I just omitted the parts which do not necessarily need to happen close to
4. for the monotonicity to be violated. My point is that 1. could become
visible to other cores long after it happened on the local core (during
4.).

