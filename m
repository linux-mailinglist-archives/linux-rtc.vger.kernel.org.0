Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D678E3A31F4
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jun 2021 19:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbhFJRXy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 10 Jun 2021 13:23:54 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:45010 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbhFJRXy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 10 Jun 2021 13:23:54 -0400
Received: by mail-ot1-f41.google.com with SMTP id q5-20020a9d66450000b02903f18d65089fso403495otm.11;
        Thu, 10 Jun 2021 10:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ifnPsB6wQoNjNoGIoOZ3f4syykDwHdUi4l5zc8NJ55Y=;
        b=O5HFamT9x37XvfLsiphsPUpX1WPPPe1DsNl18GdgX9H4Qcjxo43yF4JUgcnR0xrrDm
         BVQqraWlD8DA6icCi/2dFTRoSHjZJvg95Pj8vIQBEiUEgUCYfGEmkCBlQN8T4Hocp6/S
         iAp9/sKBixxmbvmKYS22nZBRmjzKmOvjBRJ+hUuWv/0Ktxj/106RRHVidEWfkSpi7tXz
         xTaZ+1gLxBQOG1VTdBCT3WrgdvHhNy9CPCFKY5Oa0Cn+aT2gRth7KVpaVMn+UtAdpP8j
         Em4Maet6xVhbTZHku27k/XhEgpv7mb7ThqNWunhPyPjQcB04/pgP3X+CPBzEQneHNO6L
         MJMw==
X-Gm-Message-State: AOAM533E8kDneaMQW6eJaAFVyl5dvq/1eVyZcB6djpOYhoM/7VMZ1AqY
        yUNPY7ReDufZEj3t3gOL9w==
X-Google-Smtp-Source: ABdhPJwZ2mnbD6nRpRtHSzRyehAprYA+2uqAJimI3xSlzSOJtyOGi9mT5r/GmrvQZuEkT1ji4imRAg==
X-Received: by 2002:a05:6830:43:: with SMTP id d3mr3263268otp.118.1623345704552;
        Thu, 10 Jun 2021 10:21:44 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.113])
        by smtp.gmail.com with ESMTPSA id u1sm629502ooo.18.2021.06.10.10.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 10:21:43 -0700 (PDT)
Received: (nullmailer pid 2054170 invoked by uid 1000);
        Thu, 10 Jun 2021 17:21:41 -0000
Date:   Thu, 10 Jun 2021 12:21:41 -0500
From:   Rob Herring <robh@kernel.org>
To:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: rtc: zynqmp: convert bindings to YAML
Message-ID: <20210610172141.GA1972573@robh.at.kernel.org>
References: <20210602000918.779983-1-iwamatsu@nigauri.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602000918.779983-1-iwamatsu@nigauri.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Jun 02, 2021 at 09:09:18AM +0900, Nobuhiro Iwamatsu wrote:
> Convert Real Time Clock for Xilinx Zynq MPSoC SoC bindings documentation
> to YAML schemas.
> And this renamed the file to compatible string of DT.
> 
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> ---
> 
> v2: Fix warning with DT_CHECKER_FLAGS=-m
> 
>  .../bindings/rtc/xlnx,zynqmp-rtc.yaml         | 61 +++++++++++++++++++
>  .../devicetree/bindings/rtc/xlnx-rtc.txt      | 25 --------
>  2 files changed, 61 insertions(+), 25 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/rtc/xlnx-rtc.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml b/Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml
> new file mode 100644
> index 00000000000000..c205cb86ef00be
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/xlnx,zynqmp-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xilinx Zynq Ultrascale+ MPSoC Real Time Clock
> +
> +description: |

Don't need '|'

> +  RTC controller for the Xilinx Zynq MPSoC Real Time Clock.
> +  This separates IRQ lines for seconds and alarm.

The RTC controller has separate IRQ...

> +
> +maintainers:
> +  - Michal Simek <michal.simek@xilinx.com>
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    const: xlnx,zynqmp-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 2
> +
> +  interrupt-names:
> +    items:
> +      - const: alarm
> +      - const: sec
> +
> +  calibration:
> +    description: |
> +      calibration value for 1 sec period which will
> +      be programmed directly to calibration register.

Needs a type $ref.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      rtc: rtc@ffa60000 {
> +        compatible = "xlnx,zynqmp-rtc";
> +        reg = <0x0 0xffa60000 0x0 0x100>;
> +        interrupt-parent = <&gic>;
> +        interrupts = <0 26 4>, <0 27 4>;
> +        interrupt-names = "alarm", "sec";
> +        calibration = <0x198233>;
> +      };
> +    };
