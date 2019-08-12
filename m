Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED1B8AB03
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Aug 2019 01:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbfHLXQK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 12 Aug 2019 19:16:10 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34936 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbfHLXQJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 12 Aug 2019 19:16:09 -0400
Received: by mail-ot1-f68.google.com with SMTP id g17so14558703otl.2;
        Mon, 12 Aug 2019 16:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b3F8cSXbwyXxOx36/4par1yDAVAF3gxElrC7BSSyulw=;
        b=Ue5kVppAklRtSKkS2ATfBwxCY3ziWNTHnCACtMoHI/vQHf01WpEuHrgB7w+coi/Ec/
         s5EJ5J/5lPJIm6LqBsYTBdKZ792nYZh2/EgUm3ciWefNjaZVdgAaPeGJfNqnKehKjSNe
         DWvf4cfL7sPnAjtMJtm0gC7PSu+/oL16eUzMcbH5bwOaSDYL2Nz3maMW3x4KwoGne6QR
         sNP83fn9p4+thP+W4xrZ7DpvWNVeL6G+VGvc3hbyerWL00gmPxwaHK7/eMbpR95dRa96
         ZzTd2Dub3nn8/x4E/XyYSL9ZeAjmAH8Eac5GINK/VsmS+YLGSYz0FWqCXoxB/Ju1Eqcq
         TUww==
X-Gm-Message-State: APjAAAXbiEAWEDdOZYEvnRNxfRgXFLTQ4jIhFiatsfodLknJpxyLuJfc
        L9pZoa716u2z/LCYFJSCng==
X-Google-Smtp-Source: APXvYqxsdId/zjMYF6BYZWwhP/EwTVKYWAwb0W4bGfR8//ahEJLuOXW0jurLYRTwC5NiDRtI2sJnvg==
X-Received: by 2002:a5e:9e42:: with SMTP id j2mr15577447ioq.133.1565651768590;
        Mon, 12 Aug 2019 16:16:08 -0700 (PDT)
Received: from localhost ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id o3sm19123521ioo.74.2019.08.12.16.16.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 16:16:08 -0700 (PDT)
Date:   Mon, 12 Aug 2019 17:16:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biwen Li <biwen.li@nxp.com>
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        leoyang.li@nxp.com, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, xiaobo.xie@nxp.com,
        jiafei.pan@nxp.com, ran.wang_1@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Subject: Re: [v6,2/2] dt-bindings: rtc: add bindings for FlexTimer Module
Message-ID: <20190812231607.GA21242@bogus>
References: <20190719035400.9800-1-biwen.li@nxp.com>
 <20190719035400.9800-2-biwen.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190719035400.9800-2-biwen.li@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Jul 19, 2019 at 11:54:00AM +0800, Biwen Li wrote:
> The patch adds bindings for FlexTimer Module
> 
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
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
>  .../bindings/rtc/rtc-fsl-ftm-alarm.txt        | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> new file mode 100644
> index 000000000000..9291b022ffc7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> @@ -0,0 +1,41 @@
> +Freescale FlexTimer Module (FTM) Alarm
> +
> +Required properties:
> +- compatible : Should be "fsl,<chip>-ftm-alarm", the
> +	       supported chips include
> +	       "fsl,ls1012a-ftm-alarm"
> +	       "fsl,ls1021a-ftm-alarm"
> +	       "fsl,ls1028a-ftm-alarm"
> +	       "fsl,ls1043a-ftm-alarm"
> +	       "fsl,ls1046a-ftm-alarm"
> +	       "fsl,ls1088a-ftm-alarm"
> +	       "fsl,ls208xa-ftm-alarm"
> +- reg : Specifies base physical address and size of the register sets for the
> +  FlexTimer Module.
> +- interrupts : Should be the FlexTimer Module interrupt.
> +- fsl,rcpm-wakeup property and rcpm node : Please refer
> +	Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> +
> +Optional properties:
> +- big-endian: If the host controller is big-endian mode, specify this property.
> +  The default endian mode is little-endian.
> +
> +Example:
> +aliases {
> +	...
> +	rtc1 = ftm_alarm0; // Use FlexTimer Module as /dev/rtc1
> +	...
> +};

As I said before, drop this. It's not going to work when this is 
converted to schema and the example is compiled. Feel free to convert 
this to schema and see...
 
> +
> +rcpm: rcpm@1e34040 {
> +	compatible = "fsl,ls1088a-rcpm", "fsl,qoriq-rcpm-2.1+";
> +	reg = <0x0 0x1e34040 0x0 0x18>;
> +	#fsl,rcpm-wakeup-cells = <6>;
> +};
> +
> +ftm_alarm0: timer@2800000 {

If this is an RTC, then rtc@...

> +	compatible = "fsl,ls1088a-ftm-alarm";
> +	reg = <0x0 0x2800000 0x0 0x10000>;
> +	fsl,rcpm-wakeup = <&rcpm 0x0 0x0 0x0 0x0 0x4000 0x0>;
> +	interrupts = <0 44 4>;
> +};
> -- 
> 2.17.1
> 
