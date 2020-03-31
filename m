Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 150B319A067
	for <lists+linux-rtc@lfdr.de>; Tue, 31 Mar 2020 23:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730677AbgCaVCx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 31 Mar 2020 17:02:53 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:34809 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730829AbgCaVCx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 31 Mar 2020 17:02:53 -0400
Received: by mail-io1-f67.google.com with SMTP id h131so23304270iof.1;
        Tue, 31 Mar 2020 14:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5M5OFYVaj+pp7i52Q4lF1Wgn8amY7YTmAivGgbF5jjs=;
        b=TY2l2qsqZyxUhOjmBC+F+/1H7WoCkIM2TYgsv6J7tHT1AZF/3/dkptUCnZqHScCtBP
         22bPhy/QirZJbxfMgaZiGrNJOR5kwKdroNi3pyp9tKwYcwRhhRcamIjBfLJ55SqeA3ov
         +Afp9oHT/RzYwsCiTKyzYennQuc6gWauelAOhiERyLmA2MQue7+oksdRZwrjC9S0wkIM
         Tyri7FZkzY4TudOIFteJ1zZwd6gqtwRuYkzwPPC7onF1tBOyrd1Ov/Qbo9JpP8VMglV6
         2Fq2IfLT3grQi+1qpZwyNiJkhRd7Csan82oNrNqaARRQhf3RNLCm53DHOM+V3vNMXo2P
         MCVQ==
X-Gm-Message-State: ANhLgQ1X+VKGZK+OWHcz2m5sRQpJ6u1FYWyQAgoyW/cngJCc5/cOcN34
        uexvZiCgRpX16QVzVdqxiA==
X-Google-Smtp-Source: ADFU+vul8p0TCgRRT9sqmCuFslqjxW538QF1pBOyv5dfAOMhhXTJCyduY1RQDmbqPCac5hQfMfQSww==
X-Received: by 2002:a5d:87c6:: with SMTP id q6mr12199861ios.163.1585688571170;
        Tue, 31 Mar 2020 14:02:51 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id y71sm6197ilk.23.2020.03.31.14.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 14:02:50 -0700 (PDT)
Received: (nullmailer pid 2196 invoked by uid 1000);
        Tue, 31 Mar 2020 21:02:48 -0000
Date:   Tue, 31 Mar 2020 15:02:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sergey.Semin@baikalelectronics.ru
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: interrupt-controller: Convert
 mti,gic to DT schema
Message-ID: <20200331210248.GA27684@bogus>
References: <20200306125622.839ED80307C4@mail.baikalelectronics.ru>
 <20200324174325.14213-1-Sergey.Semin@baikalelectronics.ru>
 <20200324174325.14213-3-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324174325.14213-3-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Mar 24, 2020 at 08:43:21PM +0300, Sergey.Semin@baikalelectronics.ru wrote:
> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> Modern device tree bindings are supposed to be created as YAML-files
> in accordance with DT schema. This commit replaces MIPS GIC legacy bare
> text binding with YAML file. As before the binding file states that the
> corresponding dts node is supposed to be compatible with MIPS Global
> Interrupt Controller indicated by the "mti,gic" compatible string and
> to provide a mandatory interrupt-controller and '#interrupt-cells'
> properties. There might be optional registers memory range,
> "mti,reserved-cpu-vectors" and "mti,reserved-ipi-vectors" properties
> specified.
> 
> MIPS GIC also includes a free-running global timer, per-CPU count/compare
> timers, and a watchdog. Since currently the GIC Timer is only supported the
> DT schema expects an IRQ and clock-phandler charged timer sub-node with
> "mti,mips-gic-timer" compatible string.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-rtc@vger.kernel.org
> 
> ---
> 
> I don't really know who is the corresponding driver maintainer, so I
> added to the maintainers schema Paul since he used to be looking for the
> MIPS arch and Thomas looking after it now. Any idea what email should be
> specified there instead?
> 
> Similarly to the previous patch the "oneOf: - required: ..." pattern isn't
> working here. Supposedly due to the script' dtschema/lib.py
> interrupts/interrupts-extended fixup.
> ---
>  .../interrupt-controller/mips-gic.txt         |  67 --------
>  .../interrupt-controller/mti,gic.yaml         | 152 ++++++++++++++++++
>  2 files changed, 152 insertions(+), 67 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt b/Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt
> deleted file mode 100644
> index 173595305e26..000000000000
> --- a/Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -MIPS Global Interrupt Controller (GIC)
> -
> -The MIPS GIC routes external interrupts to individual VPEs and IRQ pins.
> -It also supports local (per-processor) interrupts and software-generated
> -interrupts which can be used as IPIs.  The GIC also includes a free-running
> -global timer, per-CPU count/compare timers, and a watchdog.
> -
> -Required properties:
> -- compatible : Should be "mti,gic".
> -- interrupt-controller : Identifies the node as an interrupt controller
> -- #interrupt-cells : Specifies the number of cells needed to encode an
> -  interrupt specifier.  Should be 3.
> -  - The first cell is the type of interrupt, local or shared.
> -    See <include/dt-bindings/interrupt-controller/mips-gic.h>.
> -  - The second cell is the GIC interrupt number.
> -  - The third cell encodes the interrupt flags.
> -    See <include/dt-bindings/interrupt-controller/irq.h> for a list of valid
> -    flags.
> -
> -Optional properties:
> -- reg : Base address and length of the GIC registers.  If not present,
> -  the base address reported by the hardware GCR_GIC_BASE will be used.
> -- mti,reserved-cpu-vectors : Specifies the list of CPU interrupt vectors
> -  to which the GIC may not route interrupts.  Valid values are 2 - 7.
> -  This property is ignored if the CPU is started in EIC mode.
> -- mti,reserved-ipi-vectors : Specifies the range of GIC interrupts that are
> -  reserved for IPIs.
> -  It accepts 2 values, the 1st is the starting interrupt and the 2nd is the size
> -  of the reserved range.
> -  If not specified, the driver will allocate the last 2 * number of VPEs in the
> -  system.
> -
> -Required properties for timer sub-node:
> -- compatible : Should be "mti,gic-timer".
> -- interrupts : Interrupt for the GIC local timer.
> -
> -Optional properties for timer sub-node:
> -- clocks : GIC timer operating clock.
> -- clock-frequency : Clock frequency at which the GIC timers operate.
> -
> -Note that one of clocks or clock-frequency must be specified.
> -
> -Example:
> -
> -	gic: interrupt-controller@1bdc0000 {
> -		compatible = "mti,gic";
> -		reg = <0x1bdc0000 0x20000>;
> -
> -		interrupt-controller;
> -		#interrupt-cells = <3>;
> -
> -		mti,reserved-cpu-vectors = <7>;
> -		mti,reserved-ipi-vectors = <40 8>;
> -
> -		timer {
> -			compatible = "mti,gic-timer";
> -			interrupts = <GIC_LOCAL 1 IRQ_TYPE_NONE>;
> -			clock-frequency = <50000000>;
> -		};
> -	};
> -
> -	uart@18101400 {
> -		...
> -		interrupt-parent = <&gic>;
> -		interrupts = <GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>;
> -		...
> -	};
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml b/Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml
> new file mode 100644
> index 000000000000..1e47c0cdc231
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml
> @@ -0,0 +1,152 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)

Do you have rights to add BSD?

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/mti,gic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MIPS Global Interrupt Controller
> +
> +maintainers:
> +  - Paul Burton <paulburton@kernel.org>
> +  - Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> +
> +description: |
> +  The MIPS GIC routes external interrupts to individual VPEs and IRQ pins.
> +  It also supports local (per-processor) interrupts and software-generated
> +  interrupts which can be used as IPIs. The GIC also includes a free-running
> +  global timer, per-CPU count/compare timers, and a watchdog.
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#

Drop this.

> +
> +properties:
> +  compatible:
> +    const: mti,gic
> +
> +  "#interrupt-cells":
> +    const: 3
> +    description: |
> +      The 1st cell is the type of interrupt: local or shared defined in the
> +      file 'dt-bindings/interrupt-controller/mips-gic.h'. The 2nd cell is the
> +      GIC interrupt number. The 3d cell encodes the interrupt flags setting up
> +      the IRQ trigger modes, which are defined in the file
> +      'dt-bindings/interrupt-controller/irq.h'.
> +
> +  reg:
> +    description: |
> +      Base address and length of the GIC registers space. If not present,
> +      the base address reported by the hardware GCR_GIC_BASE will be used.
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  mti,reserved-cpu-vectors:
> +    description: |
> +      Specifies the list of CPU interrupt vectors to which the GIC may not
> +      route interrupts. This property is ignored if the CPU is started in EIC
> +      mode.
> +    allOf:
> +      - $ref: /schemas/types.yaml#definitions/uint32-array
> +      - minItems: 1
> +        maxItems: 6
> +        uniqueItems: true
> +        items:
> +          minimum: 2
> +          maximum: 7
> +
> +  mti,reserved-ipi-vectors:
> +    description: |
> +      Specifies the range of GIC interrupts that are reserved for IPIs.
> +      It accepts two values: the 1st is the starting interrupt and the 2nd is
> +      the size of the reserved range. If not specified, the driver will
> +      allocate the last (2 * number of VPEs in the system).
> +    allOf:
> +      - $ref: /schemas/types.yaml#definitions/uint32-array
> +      - items:
> +          - minimum: 0
> +            maximum: 254
> +          - minimum: 2
> +            maximum: 254
> +
> +patternProperties:
> +  "^timer(@[0-9a-f]+)?$":

If you have an unit-address, then there should be a 'reg' property.

Seems like this can be just 'timer'?

> +    type: object
> +    description: |
> +      MIPS GIC includes a free-running global timer, per-CPU count/compare
> +      timers, and a watchdog. Currently only the GIC Timer is supported.
> +    properties:
> +      compatible:
> +        const: mti,gic-timer
> +
> +      interrupts:
> +        description: |
> +          Interrupt for the GIC local timer, so normally it's suppose to be of
> +          <GIC_LOCAL X IRQ_TYPE_NONE> format.
> +        maxItems: 1
> +
> +      clocks:
> +        maxItems: 1
> +
> +      clock-frequency: true
> +
> +    required:
> +      - compatible
> +      - interrupts
> +
> +    oneOf:
> +      - required:
> +          - clocks
> +      - required:
> +          - clock-frequency
> +
> +    additionalProperties: false
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - "#interrupt-cells"
> +  - interrupt-controller
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    interrupt-controller@1bdc0000 {
> +      compatible = "mti,gic";
> +      reg = <0x1bdc0000 0x20000>;
> +      interrupt-controller;
> +      #interrupt-cells = <3>;
> +      mti,reserved-cpu-vectors = <7>;
> +      mti,reserved-ipi-vectors = <40 8>;
> +
> +      timer {
> +        compatible = "mti,gic-timer";
> +        interrupts = <GIC_LOCAL 1 IRQ_TYPE_NONE>;
> +        clock-frequency = <50000000>;
> +      };
> +    };
> +  - |
> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    interrupt-controller@1bdc0000 {
> +      compatible = "mti,gic";
> +      reg = <0x1bdc0000 0x20000>;
> +      interrupt-controller;
> +      #interrupt-cells = <3>;
> +
> +      timer {
> +        compatible = "mti,gic-timer";
> +        interrupts = <GIC_LOCAL 1 IRQ_TYPE_NONE>;
> +        clocks = <&cpu_pll>;
> +      };
> +    };
> +  - |
> +    interrupt-controller {
> +      compatible = "mti,gic";
> +      interrupt-controller;
> +      #interrupt-cells = <3>;
> +    };
> +...
> -- 
> 2.25.1
> 
