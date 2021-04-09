Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 884CF35A24D
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Apr 2021 17:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233409AbhDIPvV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Apr 2021 11:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233527AbhDIPvU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Apr 2021 11:51:20 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECED9C061762
        for <linux-rtc@vger.kernel.org>; Fri,  9 Apr 2021 08:51:07 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id h3-20020a4ae8c30000b02901b68b39e2d3so1434718ooe.9
        for <linux-rtc@vger.kernel.org>; Fri, 09 Apr 2021 08:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yjz3RZlWmDnIdbGeqiIWT3LCNv9pDPUhAL9jkHODWaA=;
        b=SwOqVBgqSt+JcynoMv7Ujr6TrdkjnuLZHQp7t35SNF73hPzBzw9x8tb1BLc69BbiNO
         W7dLfPXDZfLkLdx0lrcyiVL6+jsQCM4NwdJm1lOVJmh8urAZ3zs2HoECWdFbcNWrt7Yc
         OfCijvpq7WtT/xEbU0pY/IKhZoou4cqY0D9b9P1F8d7Dvyibi+qG5+gXBJYUS+WtcKMO
         e7Tu2sKC45647/8w4lTihc0uMC+qvfFCXfpePS1UL6v9wNCnFwdNqRG9MgM6pOrFheuG
         hRY1j+oco9SCJhjM4k2Wds5bxMO4QIqhjBJYBoFQFdWfj8RuARxqv5vjIq6U02wRjs/g
         ykSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yjz3RZlWmDnIdbGeqiIWT3LCNv9pDPUhAL9jkHODWaA=;
        b=BmUUPUyqxhbzmLZ5VcRwMhTKa2aFKLYMT67f+MJ7eNhudj2uDbRUocPHahwcKVK/ik
         K+pQuZ1N6uGUX0DdO+k6hfE3mpah/e961cReXebLzZbyw928z5joXBXteTlUFADa5kJo
         WyB6Nl5N+AVo7FF/m3U8v+FlawRW7s3WV7kxLAv+9+3EfMJVVMFJgAxHhE0Xik5Qk4gT
         sACDdDfWRwO1OHfAz+60kaVWDYZp0faQQPYEHUdXWE5DieMUZ3WydQmw+syjvFogRqia
         2jD2eJ2EBgzST/Qe+O6htEZVXoAhCmEhHCHsEmBDZNelEHJgmrp0Cqp0lRNOa8rmt79c
         gZxg==
X-Gm-Message-State: AOAM5328NZz/v12ivudfIbrqLDUftJc+G9NmBpWbbXEopv3ndTXRkdJO
        GdcAT6KXqvLZPKQ0qI2Ip/iKkg==
X-Google-Smtp-Source: ABdhPJyvjKrF8cPJGVvH9CRuffjHnJ2hFmA3Sg5thXznUR/rTeh6eMPqgmayYHLehk7FcY6WsyuEuw==
X-Received: by 2002:a05:6820:129:: with SMTP id i9mr12437657ood.80.1617983467285;
        Fri, 09 Apr 2021 08:51:07 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f129sm586154oia.9.2021.04.09.08.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 08:51:06 -0700 (PDT)
Date:   Fri, 9 Apr 2021 10:51:04 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, linux-rtc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH V2 4/4] dt-bindings: rtc: qcom-pm8xxx-rtc: Add qcom
 pm8xxx rtc bindings
Message-ID: <20210409155104.GW904837@yoga>
References: <1617976766-7852-1-git-send-email-skakit@codeaurora.org>
 <1617976766-7852-5-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617976766-7852-5-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri 09 Apr 08:59 CDT 2021, satya priya wrote:

> Add binding doc for qcom pm8xxx rtc device.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V2:
>  - Added this in V2 to have separate binding for rtc node.
> 
>  .../devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml   | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
> new file mode 100644
> index 0000000..4fba6db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/qcom-pm8xxx-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm PM8xxx PMIC RTC device
> +
> +maintainers:
> +  - Satya Priya <skakit@codeaurora.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,pm8058-rtc
> +      - qcom,pm8921-rtc
> +      - qcom,pm8941-rtc
> +      - qcom,pm8018-rtc
> +      - qcom,pmk8350-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  allow-set-time:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Indicates that the setting of RTC time is allowed by the host CPU.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +    spmi_bus: spmi@c440000 {
> +      reg = <0x0c440000 0x1100>;
> +      #address-cells = <2>;
> +      #size-cells = <0>;
> +      pmicintc: pmic@0 {
> +        reg = <0x0 SPMI_USID>;
> +        compatible = "qcom,pm8921";
> +        interrupts = <104 8>;
> +        #interrupt-cells = <2>;
> +        interrupt-controller;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pm8921_rtc: rtc@11d {
> +          compatible = "qcom,pm8921-rtc";
> +          reg = <0x11d>;
> +          interrupts = <0x27 0>;
> +        };
> +      };
> +    };
> +...
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
