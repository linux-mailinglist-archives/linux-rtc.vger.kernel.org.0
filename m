Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 810C816A4B3
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Feb 2020 12:16:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727197AbgBXLQy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 24 Feb 2020 06:16:54 -0500
Received: from mail-bn8nam11on2051.outbound.protection.outlook.com ([40.107.236.51]:20960
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727183AbgBXLQy (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 24 Feb 2020 06:16:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLLMxOzo2X4DsbAO3mSaz12G8BlOk4ImDN/9sBVv086OW/fA2j2QEwn/l+A7TfcUwDHN1Sr8jPu0o/s8C72HiGoTdbF4Vnht8+tF+roqNiK3fqO4mpbun7DcR0y93A0J1tugd5Jw5J7O3VvsjqmVAhx1r1PTxVnjfvdfS1M/xkgJ1GbH7c53NmSj8OB6k8tVqyGex0o4a37pSieFAzx2yupv1cZ03R3LrSjca7+GI9BeD36KhZCVE5T8BqBhW8bT/GdvnFdBopmlgxjQALBY5cb4sDlh3OXkeI4uDkqNEnNo2eFKr5kn8znn3oCywisTEyG5hlFA/xVIqGROK9B19w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Pr7gPEiD0+bE0kBCHf08UVzDpL18zDobWFqHourYQQ=;
 b=Qg617cDdcO41of+fbZCoY/oXxEBpYPTdDfwNNnFWsgr8fKuylHrgBZyScYlWsmAcLDVpoqC8NHu0qYYylvZmKjDCfr2DuyZ3+Mctjjx3CGdYYBewGcSWCodWX2ZXYOei5xBFsXE0XLvyTBl5bLWbl2Cy2tgwHZUz1yu13tOHub982PTDL7zNLDxsdV5MndjaOOIP2Dl4nLvN1j8yn06D17wgumPXQhotxz3fG+c5A19QyOR3Etq7uvcr1dwjAqkF2am91VTlgYjkrlojnbWFwP0QYf7OMnzGbHm9GLJ3gY6DmTXfBaU3DivTDbwD9oPdKLWNClzb35mSAQjd9ZIn2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Pr7gPEiD0+bE0kBCHf08UVzDpL18zDobWFqHourYQQ=;
 b=XMyKjqXjxtUAx7QyxnuNKuqSCQLTqJPZm7GGeO5dVAVmO0e1eVcbjEexl7Z9T7PvA48NVZM869Xp3LF/xnFYQUH9vtf2u479T5BqpD1j8lzapnW5DaKm6B2duY+oWiKyoKObjFXnKVQJgLEuFWUD0a3Vt/H3KAvBd9O8z5w7RRY=
Received: from BL0PR02CA0078.namprd02.prod.outlook.com (2603:10b6:208:51::19)
 by DM5PR02MB3877.namprd02.prod.outlook.com (2603:10b6:4:b9::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Mon, 24 Feb
 2020 11:16:51 +0000
Received: from SN1NAM02FT026.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::201) by BL0PR02CA0078.outlook.office365.com
 (2603:10b6:208:51::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.17 via Frontend
 Transport; Mon, 24 Feb 2020 11:16:51 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT026.mail.protection.outlook.com (10.152.72.97) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2750.19
 via Frontend Transport; Mon, 24 Feb 2020 11:16:50 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1j6BjG-0004T4-7i; Mon, 24 Feb 2020 03:16:50 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1j6BjB-0000gg-4M; Mon, 24 Feb 2020 03:16:45 -0800
Received: from [172.30.17.108]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1j6Bj5-0000fs-Su; Mon, 24 Feb 2020 03:16:40 -0800
Subject: Re: [PATCH] rtc: zynqmp: Add calibration set and get support
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, michal.simek@xilinx.com,
        sgoud@xilinx.com, shubhraj@xilinx.com
Cc:     linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com,
        Srinivas Goud <srinivas.goud@xilinx.com>
References: <1582191106-30431-1-git-send-email-srinivas.neeli@xilinx.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <00b3e6dd-50d6-f5a7-a861-e6db91f6eafb@xilinx.com>
Date:   Mon, 24 Feb 2020 12:16:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1582191106-30431-1-git-send-email-srinivas.neeli@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(346002)(396003)(376002)(189003)(199004)(26005)(478600001)(31696002)(6636002)(107886003)(316002)(5660300002)(2906002)(31686004)(8676002)(8936002)(356004)(9786002)(36756003)(426003)(186003)(2616005)(70586007)(81166006)(81156014)(44832011)(6666004)(336012)(70206006)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR02MB3877;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c0055e7-0c45-4e62-5bb0-08d7b91b0bb9
X-MS-TrafficTypeDiagnostic: DM5PR02MB3877:
X-Microsoft-Antispam-PRVS: <DM5PR02MB38772BCC31E42BF62A0E98F6C6EC0@DM5PR02MB3877.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 032334F434
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WyCVdl8W3E/fdoqXSuRd94M9GmTHEcfgerXl8ImW4uRIydZFyfrPXJ18QArwrzVPjUmB+IvRL/wkmLL1hYstWnLkBgx2ZTtJ/QJjcTKEpIUyoSPv0FDUv/YMac2WvRoNgBtBk4ExwP7y6p+FAnKaGNaLqIU0U36IIlomNAhLO57L0uigmNowPdNWjfAxiMlfhyg+HwnFYGWU+heG3vM7MCeDwZ+l7xy3d9zMAs/92iOXO3RI5Xx/ItDV2IwRnnlgxA/KvxIEDYz8c5pMFNQj9V3kUxlJtUq4RXSNVMcTrX9rYLG/D16FxuNfzKmPkvzjVADiby2AqNbKsEr+3cRF+B70M6iPrFMOGpx+9wIe+pl25bGu/qx9SPb1apJqdcyBuTDYW1/m0oVqK7zmKGWUMUSIaZ91MV27ZawOlOJRoQZKuNuhLb5fn8Jka7ovfVod
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2020 11:16:50.6675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0055e7-0c45-4e62-5bb0-08d7b91b0bb9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3877
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 20. 02. 20 10:31, Srinivas Neeli wrote:
> ZynqMp RTC controller has a calibration feature to compensate
> time deviation due to input clock inaccuracy.
> Set and get calibration API's are used for setting and getting
> calibration value from the controller calibration register.
> 
> Signed-off-by: Srinivas Goud <srinivas.goud@xilinx.com>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> ---
>  drivers/rtc/rtc-zynqmp.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
> index 4b1077e2f826..b4118e9e4fcc 100644
> --- a/drivers/rtc/rtc-zynqmp.c
> +++ b/drivers/rtc/rtc-zynqmp.c
> @@ -40,6 +40,12 @@
>  #define RTC_CALIB_MASK		0x1FFFFF
>  #define RTC_ALRM_MASK          BIT(1)
>  #define RTC_MSEC               1000
> +#define RTC_FR_MASK             0xF0000
> +#define RTC_SEC_MAX_VAL         0xFFFFFFFF
> +#define RTC_FR_MAX_TICKS        16
> +#define RTC_OFFSET_MAX          150000
> +#define RTC_OFFSET_MIN          -150000
> +#define RTC_PPB                 1000000000LL
>  

please use tabs here.

>  struct xlnx_rtc_dev {
>  	struct rtc_device	*rtc;
> @@ -184,12 +190,84 @@ static void xlnx_init_rtc(struct xlnx_rtc_dev *xrtcdev)
>  	writel(xrtcdev->calibval, (xrtcdev->reg_base + RTC_CALIB_WR));
>  }
>  
> +static int xlnx_rtc_read_offset(struct device *dev, long *offset)
> +{
> +	struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
> +	long offset_val;
> +	unsigned int reg;
> +	unsigned int tick_mult = RTC_PPB / xrtcdev->calibval;
> +
> +	reg = readl(xrtcdev->reg_base + RTC_CALIB_RD);
> +
> +	/* Offset with seconds ticks */
> +	offset_val = reg & RTC_TICK_MASK;
> +	offset_val = offset_val - xrtcdev->calibval;
> +	offset_val = offset_val * tick_mult;
> +
> +	/* Offset with fractional ticks */
> +	if (reg & RTC_FR_EN)
> +		offset_val += ((reg & RTC_FR_MASK) >> RTC_FR_DATSHIFT)
> +			* (tick_mult / RTC_FR_MAX_TICKS);
> +	*offset = offset_val;
> +
> +	return 0;
> +}
> +
> +static int xlnx_rtc_set_offset(struct device *dev, long offset)
> +{
> +	struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
> +	short int  max_tick;
> +	unsigned char fract_tick = 0;
> +	unsigned int  calibval;

double space.

> +	int fract_offset;
> +	unsigned int tick_mult = RTC_PPB / xrtcdev->calibval;
> +
> +	/* Make sure offset value is within supported range */
> +	if (offset < RTC_OFFSET_MIN || offset > RTC_OFFSET_MAX)
> +		return -ERANGE;
> +
> +	/* Number ticks for given offset */
> +	max_tick = div_s64_rem(offset, tick_mult, &fract_offset);
> +
> +	/* Number fractional ticks for given offset */
> +	if (fract_offset) {
> +		if (fract_offset < 0) {
> +			fract_offset = fract_offset + tick_mult;
> +			max_tick--;
> +		}
> +		if (fract_offset > (tick_mult / RTC_FR_MAX_TICKS)) {
> +			for (fract_tick = 1; fract_tick < 16; fract_tick++) {
> +				if (fract_offset <=
> +				    (fract_tick *
> +				     (tick_mult / RTC_FR_MAX_TICKS)))
> +					break;
> +			}
> +		}
> +	}
> +
> +	/* Zynqmp RTC uses second and fractional tick
> +	 * counters for compensation
> +	 */
> +	calibval = max_tick + xrtcdev->calibval;
> +
> +	if (fract_tick)
> +		calibval |= RTC_FR_EN;
> +
> +	calibval |= (fract_tick <<  RTC_FR_DATSHIFT);

here is double space.

> +
> +	writel(calibval, (xrtcdev->reg_base + RTC_CALIB_WR));
> +
> +	return 0;
> +}
> +
>  static const struct rtc_class_ops xlnx_rtc_ops = {
>  	.set_time	  = xlnx_rtc_set_time,
>  	.read_time	  = xlnx_rtc_read_time,
>  	.read_alarm	  = xlnx_rtc_read_alarm,
>  	.set_alarm	  = xlnx_rtc_set_alarm,
>  	.alarm_irq_enable = xlnx_rtc_alarm_irq_enable,
> +	.read_offset    = xlnx_rtc_read_offset,
> +	.set_offset     = xlnx_rtc_set_offset,

use tabs as is done above.

>  };
>  
>  static irqreturn_t xlnx_rtc_interrupt(int irq, void *id)
> 

The rest looks good.

Thanks,
Michal
