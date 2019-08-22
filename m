Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B0729A1D5
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 23:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389865AbfHVVMh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 17:12:37 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:56203 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729718AbfHVVMh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Aug 2019 17:12:37 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 5419DE0004;
        Thu, 22 Aug 2019 21:12:34 +0000 (UTC)
Date:   Thu, 22 Aug 2019 23:12:33 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Biwen Li <biwen.li@nxp.com>
Cc:     a.zummo@towertech.it, leoyang.li@nxp.com, robh+dt@kernel.org,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        xiaobo.xie@nxp.com, jiafei.pan@nxp.com, ran.wang_1@nxp.com,
        mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: Re: [v7,2/2] dt-bindings: rtc: add bindings for FlexTimer Module
Message-ID: <20190822211233.GD27031@piout.net>
References: <20190813030157.48590-1-biwen.li@nxp.com>
 <20190813030157.48590-2-biwen.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813030157.48590-2-biwen.li@nxp.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 13/08/2019 11:01:57+0800, Biwen Li wrote:
> The patch adds bindings for FlexTimer Module
> 
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
> Change in v7:
>     - delete aliases
> 
> Change in v6:
>     - correct subject
>     - delete note
>     - remove reg property about IP Powerdown exception register
> 
> Change in v5:
>     - None
> 
> Change in v4:
>     - add note about dts and kernel options
>     - add aliases in example
> 
> Change in v3:
> 	- remove reg-names property
> 	- correct cells number
> 
> Change in v2:
> 	- replace ls1043a with ls1088a as example
> 	- add rcpm node and fsl,rcpm-wakeup property
> 
>  .../bindings/rtc/rtc-fsl-ftm-alarm.txt        | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
