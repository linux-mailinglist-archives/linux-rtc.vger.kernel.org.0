Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC0410C4CC
	for <lists+linux-rtc@lfdr.de>; Thu, 28 Nov 2019 09:16:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727317AbfK1IQZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 28 Nov 2019 03:16:25 -0500
Received: from mail-eopbgr800053.outbound.protection.outlook.com ([40.107.80.53]:42640
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726882AbfK1IQZ (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 28 Nov 2019 03:16:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgie/jXMaZzfg7D3wGo8K4r/M4oBUFQafVKaZw5sA0zOCTxqLgPl2lTrERICEwr0UN3IP6p9JO0qOOpIb9zCxJBYmItL3KmkbZCAg60cgxnHllEaQK/rokSzCg2Uk+DRtSbqrq/GJhQzWUweTOz8Wh1/Zqdx4qsc2efJiR1rXi0K+88PHCQtad6hlQOm8bePgi1Y7jeRAKk82nZwuNSf4N/Z+NkKMWA72sbPtSxcy7tC3WLYedA7ZRT5oPv+3w+qkJSt13QOEEnUDI0Y87ZmM6TQMq1dypUuMAfuOr8kE5aqPEcx1+vJmZMwuL/ptwPVl5Z5jm5Qg1Hc+fvguR7rPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wi+AWYYgz9tqzDwkKuqRx+eAL4GQnemJSs/H+ydRDqc=;
 b=L9hJ4VFkNCIubCStyAyGkuSVVWU/39859erhloNDYqQo6y+ki2GYU/BvrbiYeYr1GmbNWpjYhYp+NFyHu5hbfc4UDgJVQXNQBgBT1JQhwXbYy6yRc4LBgztaUD+kq81R3Vnmxl2rxT6q91o5HLzEotUKc7cPyTrIX0N94mVuWWCT6ncIt5Jz8b8vlVcmvcySeOT/lKVGQkm0wYouZxfZA/bYp7zsPIPwRSlU21ZSU99+NYVfLEX2VSE400e6Qr5vl/BuX/1gZLk/ws7TnMA7XwGHtVVCa65rVQJBUeFyONTxOjHuzVSNR+faJdw9CGw7jU8bkn54Q9X8x9EPSc5CDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wi+AWYYgz9tqzDwkKuqRx+eAL4GQnemJSs/H+ydRDqc=;
 b=Ni6Mdfqr5SVpS/I1Qz+tRdUgcwLfhtq/+RvlEuDjyaaLR4IdSLPdu/8Mph4+FHePZc6NxxFFUSRVPNpablJmSQOIBKkITpu34nI5KxuXVG4I4XXy2IersdcqY03vL0qwkAYGHZXI3zws0EHZNLUCCnVAOMhmgkCNyntrSExWgVM=
Received: from CY4PR02CA0034.namprd02.prod.outlook.com (2603:10b6:903:117::20)
 by DM6PR02MB6970.namprd02.prod.outlook.com (2603:10b6:5:258::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18; Thu, 28 Nov
 2019 08:16:22 +0000
Received: from CY1NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::202) by CY4PR02CA0034.outlook.office365.com
 (2603:10b6:903:117::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.17 via Frontend
 Transport; Thu, 28 Nov 2019 08:16:22 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT023.mail.protection.outlook.com (10.152.74.237) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2474.17
 via Frontend Transport; Thu, 28 Nov 2019 08:16:22 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1iaEyL-000271-NE; Thu, 28 Nov 2019 00:16:21 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1iaEyG-0001gZ-KI; Thu, 28 Nov 2019 00:16:16 -0800
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id xAS8G6n5030933;
        Thu, 28 Nov 2019 00:16:06 -0800
Received: from [172.30.17.107]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1iaEy6-0001e7-1o; Thu, 28 Nov 2019 00:16:06 -0800
Subject: Re: [PATCH 1/2] rtc: zynqmp: re-use rtc_time64_to_tm operation
To:     Jean-Francois Dagenais <jeff.dagenais@gmail.com>,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     git@xilinx.com, linux-rtc@vger.kernel.org, michal.simek@xilinx.com,
        champagne.guillaume.c@gmail.com, maxime.roussinbelanger@gmail.com
References: <20191128015613.10003-1-jeff.dagenais@gmail.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <5330097c-1f59-4cf6-8dad-dd283d4823ce@xilinx.com>
Date:   Thu, 28 Nov 2019 09:16:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191128015613.10003-1-jeff.dagenais@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(136003)(189003)(199004)(50466002)(58126008)(2906002)(47776003)(81166006)(65806001)(65956001)(8676002)(4326008)(5660300002)(9786002)(8936002)(230700001)(2486003)(23676004)(6246003)(305945005)(106002)(81156014)(316002)(36756003)(76176011)(70586007)(70206006)(446003)(336012)(11346002)(426003)(2616005)(31686004)(26005)(6666004)(356004)(186003)(31696002)(229853002)(478600001)(36386004)(44832011);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR02MB6970;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1653200f-c68e-409e-8ff8-08d773db4117
X-MS-TrafficTypeDiagnostic: DM6PR02MB6970:
X-Microsoft-Antispam-PRVS: <DM6PR02MB69705BD8E5C8FC41C48F7A3CC6470@DM6PR02MB6970.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:425;
X-Forefront-PRVS: 0235CBE7D0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k/tyUNGokAmp+ahOAq8ZWyM6hkAf3IGxsMEIGMog616ZITLVsrIczR6JXa7vsQTk9e0mu0gNMkPBe4hBckboBOMRaKJKuVwJ4Xty9pu4XikybFTCdtFaNAj/M7zAsMUL0S1JzTXXpeE19fsQl9iAwP8mx/G4+djwARxk+MKv8YqVo6IV/IrzNcl6jlpOrQFPomINk22ObKClTRBv3qjy2mvXr+yXl4/wVAoi1sZ/2+ngyo3+vKG41n3kvoNJ50V+4xuLCtg1rrHr9YR0jo0FhhjV9pS6mJ862aBIIYel0jZ7VHgc86ksIpGsIcnF8pjEeuHWdRBWpEklhoTDAXAq322Z1kWWtsBJoDrX0+BZtcT5KPm9lcRnxMC8pqXyOKfffAp1n+EU4RlaeVsOkIw0yTz5jrPs/ZrZfj9aCHflIdDBX2heWDxnWo85FzPxQF/d
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2019 08:16:22.2028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1653200f-c68e-409e-8ff8-08d773db4117
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6970
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 28. 11. 19 2:56, Jean-Francois Dagenais wrote:
> This allows a subsequent commit to spin_unlock sooner.
> 
> Signed-off-by: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
> ---
>   drivers/rtc/rtc-zynqmp.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
> index 2c762757fb54..cb78900ec1f5 100644
> --- a/drivers/rtc/rtc-zynqmp.c
> +++ b/drivers/rtc/rtc-zynqmp.c
> @@ -94,7 +94,7 @@ static int xlnx_rtc_read_time(struct device *dev, struct rtc_time *tm)
>   		 * RTC has updated the CURRENT_TIME with the time written into
>   		 * SET_TIME_WRITE register.
>   		 */
> -		rtc_time64_to_tm(readl(xrtcdev->reg_base + RTC_CUR_TM), tm);
> +		read_time = readl(xrtcdev->reg_base + RTC_CUR_TM);
>   	} else {
>   		/*
>   		 * Time written in SET_TIME_WRITE has not yet updated into
> @@ -104,8 +104,8 @@ static int xlnx_rtc_read_time(struct device *dev, struct rtc_time *tm)
>   		 * reading.
>   		 */
>   		read_time = readl(xrtcdev->reg_base + RTC_SET_TM_RD) - 1;
> -		rtc_time64_to_tm(read_time, tm);
>   	}
> +	rtc_time64_to_tm(read_time, tm);
>   
>   	return 0;
>   }
> 

Reviewed-by: Michal Simek <michal.simek@xilinx.com>

M

