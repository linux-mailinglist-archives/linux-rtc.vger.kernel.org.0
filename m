Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BDE215A6F2
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2020 11:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725767AbgBLKtK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 12 Feb 2020 05:49:10 -0500
Received: from mail-eopbgr750043.outbound.protection.outlook.com ([40.107.75.43]:9630
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725821AbgBLKtJ (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 12 Feb 2020 05:49:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YlTk8kbqXCc0g4yZnpiVdT1Wx7iLyA5yjOU3aPluD/znhFyilQ6ISTCVtC7ciq4zwtdbPa4ElCN/lbydsw+MqwPceoBlTAlRSoewkArhZmJquSav8gFsc27/wFf64OQlabiKdUV+A5KKVC3s5OVUdxJwF7whm9DXZWgVqjhd+CaCgz+TEelaou7Ef1zIcxi9S+j4HIK5DQzYidHL5VXrvAkblosXJTdnAJcF8gCCzLMm9HiT6ESBF1AedQ/IU+fFB+0UEEPS7nfhXmZihLPouBkvJ/UHgueKVVK6VvjNYGUCc3gHkMumldTKDctncg1EkzUx/orBZapmcCwf3UPPiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4hSeuC0zIxBCgieIGsdVvKRDsXXf01QTiR1Dh1z6YY=;
 b=GVTU7yU6BTNUeFQev2/KcdVewA7hhj2gTAbL0K09vhhZOezAYUGq50SGh1pihY9yfJkI35UVZZvhspdW2nRydny/rCBFnt0hvwvwD1QxDB4D+vunjghCMm+Fvmjb/f+80/D/kv1MBrbNaMqCDPP9v9J3Mk6vbPLPD5muNqw+uDzJ7fj8/zbhaYlfp7B7lRvkQB/1flBx2HJsZRpWv3jM+13ctgIFIwCUH8pd3IvTRuv3YVwLaJvwKaGc0y8MtT6Cv+qQqp4BVfStpradh8fch6hhuP9QmLyI7aDOAEib9wh1DBjCBW7hxS6jY5GwQrN8JxXyNvVt6kqVymHLGazcTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=towertech.it smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4hSeuC0zIxBCgieIGsdVvKRDsXXf01QTiR1Dh1z6YY=;
 b=Vxa1O1ScnUFNcse3wk4nH3KDgqozYp/pyIOUoQRNnUq70rXGxZzlR1mDWF1oHTc2qSu1V7wjbQJeWgFO4m8z0Y/CyhrgmNe7QZwDEVz5alwS73aBWUf3PVc3yQYVqitOjFaNSVuh2x2Ekp++/Z5bHvEfivIXQwWLYG9Vqc1Rb/Q=
Received: from SN4PR0201CA0002.namprd02.prod.outlook.com
 (2603:10b6:803:2b::12) by CY4PR02MB2501.namprd02.prod.outlook.com
 (2603:10b6:903:72::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22; Wed, 12 Feb
 2020 10:49:02 +0000
Received: from BL2NAM02FT045.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::208) by SN4PR0201CA0002.outlook.office365.com
 (2603:10b6:803:2b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.25 via Frontend
 Transport; Wed, 12 Feb 2020 10:49:02 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; towertech.it; dkim=none (message not signed)
 header.d=none;towertech.it; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT045.mail.protection.outlook.com (10.152.77.16) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2729.22
 via Frontend Transport; Wed, 12 Feb 2020 10:49:01 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1j1pZl-0007zr-73; Wed, 12 Feb 2020 02:49:01 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1j1pZg-0006E2-2Q; Wed, 12 Feb 2020 02:48:56 -0800
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 01CAmnCf020766;
        Wed, 12 Feb 2020 02:48:49 -0800
Received: from [172.30.17.107]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1j1pZY-0006Az-Vi; Wed, 12 Feb 2020 02:48:49 -0800
Subject: Re: [PATCH v2] rtc: zynqmp: Clear alarm interrupt status before
 interrupt enable
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, michal.simek@xilinx.com,
        sgoud@xilinx.com, shubhraj@xilinx.com
Cc:     linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com
References: <1581503079-387-1-git-send-email-srinivas.neeli@xilinx.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <efe5e4e9-5c4b-fbbf-b333-b8bcaed82ada@xilinx.com>
Date:   Wed, 12 Feb 2020 11:48:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1581503079-387-1-git-send-email-srinivas.neeli@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(189003)(199004)(70586007)(186003)(9786002)(70206006)(31696002)(2616005)(31686004)(336012)(2906002)(81166006)(81156014)(8936002)(8676002)(26005)(5660300002)(426003)(6666004)(356004)(4326008)(498600001)(107886003)(44832011)(36756003)(6636002);DIR:OUT;SFP:1101;SCL:1;SRVR:CY4PR02MB2501;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 970650e2-ed77-426a-7bb2-08d7afa92c15
X-MS-TrafficTypeDiagnostic: CY4PR02MB2501:
X-Microsoft-Antispam-PRVS: <CY4PR02MB2501AAFAD2CEA0EC5C22AAABC61B0@CY4PR02MB2501.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0311124FA9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uxdqM9PHpKl2l7tmavdD2YEnoiTVBP9Qut6+AkR0pOdyKFHTM3YuF4MrGk3GnbXAn323oU1HKJDrGvVmgjA6KLQvYrh3HkqaT9cWs1vCpmNFZwaFzFuyeGR83+ImRa7HVyobI/UgtdSmzwxTA8SMCTtLxFEG/vxQBbLz02Tjac3ipvaWqnvHUf0tVdm2Z9oWEkKX0rrk4BVBBovTfXprJy3uXPIyOsEehQDsog+W3qEX7x9WEEledsrXvSMY3GM9nz5fUt3gKkJ0SiG9cXTtrlYQEX/iioPviSlJWwDL38Gluj2mRqk8xjblgd5nE5RZQ4DYFltBrE8mtXdwTte95IIDsGF25q2p5zwSfoaig8eLhTCa33aNlnQx2HSa85Z7Xy//QMBAu9mjTVzDbggme9Xe9HnH12V9Zy2ozvJxaGLMzUkERywrK0B882+2V0lb
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2020 10:49:01.7761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 970650e2-ed77-426a-7bb2-08d7afa92c15
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2501
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 12. 02. 20 11:24, Srinivas Neeli wrote:
> Fix multiple occurring interrupts for alarm interrupt. RTC module doesn't
> clear the alarm interrupt status bit immediately after the interrupt is
> triggered.This is due to the sticky nature of the alarm interrupt status
> register. The alarm interrupt status register can be cleared only after
> the second counter outruns the set alarm value. To fix multiple spurious
> interrupts, disable alarm interrupt in the handler and clear the status
> bit before enabling the alarm interrupt.
> 
> Fixes: 11143c19eb57 ("rtc: add xilinx zynqmp rtc driver")
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> ---
> Changes in V2:
> Addressed Michal Simek comments
>  - Removed new line in declartion part.
>  - Added new line before return.
> ---
>  drivers/rtc/rtc-zynqmp.c | 27 +++++++++++++++++++++++----
>  1 file changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
> index 5786866c09e9..4b1077e2f826 100644
> --- a/drivers/rtc/rtc-zynqmp.c
> +++ b/drivers/rtc/rtc-zynqmp.c
> @@ -38,6 +38,8 @@
>  
>  #define RTC_CALIB_DEF		0x198233
>  #define RTC_CALIB_MASK		0x1FFFFF
> +#define RTC_ALRM_MASK          BIT(1)
> +#define RTC_MSEC               1000
>  
>  struct xlnx_rtc_dev {
>  	struct rtc_device	*rtc;
> @@ -123,11 +125,28 @@ static int xlnx_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>  static int xlnx_rtc_alarm_irq_enable(struct device *dev, u32 enabled)
>  {
>  	struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
> +	unsigned int status;
> +	ulong timeout;
> +
> +	timeout = jiffies + msecs_to_jiffies(RTC_MSEC);
> +
> +	if (enabled) {
> +		while (1) {
> +			status = readl(xrtcdev->reg_base + RTC_INT_STS);
> +			if (!((status & RTC_ALRM_MASK) == RTC_ALRM_MASK))
> +				break;
> +
> +			if (time_after_eq(jiffies, timeout)) {
> +				dev_err(dev, "Time out occur, while clearing alarm status bit\n");
> +				return -ETIMEDOUT;
> +			}
> +			writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_STS);
> +		}
>  
> -	if (enabled)
>  		writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_EN);
> -	else
> +	} else {
>  		writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_DIS);
> +	}
>  
>  	return 0;
>  }
> @@ -183,8 +202,8 @@ static irqreturn_t xlnx_rtc_interrupt(int irq, void *id)
>  	if (!(status & (RTC_INT_SEC | RTC_INT_ALRM)))
>  		return IRQ_NONE;
>  
> -	/* Clear RTC_INT_ALRM interrupt only */
> -	writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_STS);
> +	/* Disable RTC_INT_ALRM interrupt only */
> +	writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_DIS);
>  
>  	if (status & RTC_INT_ALRM)
>  		rtc_update_irq(xrtcdev->rtc, 1, RTC_IRQF | RTC_AF);
> 

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal

