Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44B6519B823
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Apr 2020 00:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732735AbgDAWHu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 1 Apr 2020 18:07:50 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:58510 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732357AbgDAWHu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 1 Apr 2020 18:07:50 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 0D7828030886;
        Wed,  1 Apr 2020 22:07:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id KYpXvjdddVu8; Thu,  2 Apr 2020 01:07:46 +0300 (MSK)
Date:   Thu, 2 Apr 2020 01:07:50 +0300
From:   Sergey Semin <Sergey.Semin@baikalelectronics.ru>
To:     Rob Herring <robh@kernel.org>
CC:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        <devicetree@vger.kernel.org>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: interrupt-controller: Convert
 mti,gic to DT schema
Message-ID: <20200401220750.wsoxsxr547aewtgt@ubsrv2.baikal.int>
References: <20200306125622.839ED80307C4@mail.baikalelectronics.ru>
 <20200324174325.14213-1-Sergey.Semin@baikalelectronics.ru>
 <20200324174325.14213-3-Sergey.Semin@baikalelectronics.ru>
 <20200331210248.GA27684@bogus>
 <20200401101930.3lk4t6wk6j5ne6ay@ubsrv2.baikal.int>
 <CAL_JsqJBVTahd9uQPe6KUfVxzGPrGfFarcKBU=EPpon6Ny=Sqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJBVTahd9uQPe6KUfVxzGPrGfFarcKBU=EPpon6Ny=Sqg@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Apr 01, 2020 at 08:13:58AM -0600, Rob Herring wrote:
> On Wed, Apr 1, 2020 at 4:19 AM Sergey Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> >
> > On Tue, Mar 31, 2020 at 03:02:48PM -0600, Rob Herring wrote:
> > > On Tue, Mar 24, 2020 at 08:43:21PM +0300, Sergey.Semin@baikalelectronics.ru wrote:
> > > > From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > >
> > > > Modern device tree bindings are supposed to be created as YAML-files
> > > > in accordance with DT schema. This commit replaces MIPS GIC legacy bare
> > > > text binding with YAML file. As before the binding file states that the
> > > > corresponding dts node is supposed to be compatible with MIPS Global
> > > > Interrupt Controller indicated by the "mti,gic" compatible string and
> > > > to provide a mandatory interrupt-controller and '#interrupt-cells'
> > > > properties. There might be optional registers memory range,
> > > > "mti,reserved-cpu-vectors" and "mti,reserved-ipi-vectors" properties
> > > > specified.
> > > >
> > > > MIPS GIC also includes a free-running global timer, per-CPU count/compare
> > > > timers, and a watchdog. Since currently the GIC Timer is only supported the
> > > > DT schema expects an IRQ and clock-phandler charged timer sub-node with
> > > > "mti,mips-gic-timer" compatible string.
> > > >
> > > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > > > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > > > Cc: Paul Burton <paulburton@kernel.org>
> > > > Cc: Ralf Baechle <ralf@linux-mips.org>
> > > > Cc: Alessandro Zummo <a.zummo@towertech.it>
> > > > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > > Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> > > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > > Cc: Arnd Bergmann <arnd@arndb.de>
> > > > Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > > Cc: Rob Herring <robh+dt@kernel.org>
> > > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > > Cc: devicetree@vger.kernel.org
> > > > Cc: linux-rtc@vger.kernel.org
> > > >
> > > > ---
> > > >
> > > > I don't really know who is the corresponding driver maintainer, so I
> > > > added to the maintainers schema Paul since he used to be looking for the
> > > > MIPS arch and Thomas looking after it now. Any idea what email should be
> > > > specified there instead?
> > > >
> > > > Similarly to the previous patch the "oneOf: - required: ..." pattern isn't
> > > > working here. Supposedly due to the script' dtschema/lib.py
> > > > interrupts/interrupts-extended fixup.
> > > > ---
> > > >  .../interrupt-controller/mips-gic.txt         |  67 --------
> > > >  .../interrupt-controller/mti,gic.yaml         | 152 ++++++++++++++++++
> > > >  2 files changed, 152 insertions(+), 67 deletions(-)
> > > >  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt
> > > >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt b/Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt
> > > > deleted file mode 100644
> > > > index 173595305e26..000000000000
> > > > --- a/Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt
> > > > +++ /dev/null
> > > > @@ -1,67 +0,0 @@
> > > > -MIPS Global Interrupt Controller (GIC)
> > > > -
> > > > -The MIPS GIC routes external interrupts to individual VPEs and IRQ pins.
> > > > -It also supports local (per-processor) interrupts and software-generated
> > > > -interrupts which can be used as IPIs.  The GIC also includes a free-running
> > > > -global timer, per-CPU count/compare timers, and a watchdog.
> > > > -
> > > > -Required properties:
> > > > -- compatible : Should be "mti,gic".
> > > > -- interrupt-controller : Identifies the node as an interrupt controller
> > > > -- #interrupt-cells : Specifies the number of cells needed to encode an
> > > > -  interrupt specifier.  Should be 3.
> > > > -  - The first cell is the type of interrupt, local or shared.
> > > > -    See <include/dt-bindings/interrupt-controller/mips-gic.h>.
> > > > -  - The second cell is the GIC interrupt number.
> > > > -  - The third cell encodes the interrupt flags.
> > > > -    See <include/dt-bindings/interrupt-controller/irq.h> for a list of valid
> > > > -    flags.
> > > > -
> > > > -Optional properties:
> > > > -- reg : Base address and length of the GIC registers.  If not present,
> > > > -  the base address reported by the hardware GCR_GIC_BASE will be used.
> > > > -- mti,reserved-cpu-vectors : Specifies the list of CPU interrupt vectors
> > > > -  to which the GIC may not route interrupts.  Valid values are 2 - 7.
> > > > -  This property is ignored if the CPU is started in EIC mode.
> > > > -- mti,reserved-ipi-vectors : Specifies the range of GIC interrupts that are
> > > > -  reserved for IPIs.
> > > > -  It accepts 2 values, the 1st is the starting interrupt and the 2nd is the size
> > > > -  of the reserved range.
> > > > -  If not specified, the driver will allocate the last 2 * number of VPEs in the
> > > > -  system.
> > > > -
> > > > -Required properties for timer sub-node:
> > > > -- compatible : Should be "mti,gic-timer".
> > > > -- interrupts : Interrupt for the GIC local timer.
> > > > -
> > > > -Optional properties for timer sub-node:
> > > > -- clocks : GIC timer operating clock.
> > > > -- clock-frequency : Clock frequency at which the GIC timers operate.
> > > > -
> > > > -Note that one of clocks or clock-frequency must be specified.
> > > > -
> > > > -Example:
> > > > -
> > > > -   gic: interrupt-controller@1bdc0000 {
> > > > -           compatible = "mti,gic";
> > > > -           reg = <0x1bdc0000 0x20000>;
> > > > -
> > > > -           interrupt-controller;
> > > > -           #interrupt-cells = <3>;
> > > > -
> > > > -           mti,reserved-cpu-vectors = <7>;
> > > > -           mti,reserved-ipi-vectors = <40 8>;
> > > > -
> > > > -           timer {
> > > > -                   compatible = "mti,gic-timer";
> > > > -                   interrupts = <GIC_LOCAL 1 IRQ_TYPE_NONE>;
> > > > -                   clock-frequency = <50000000>;
> > > > -           };
> > > > -   };
> > > > -
> > > > -   uart@18101400 {
> > > > -           ...
> > > > -           interrupt-parent = <&gic>;
> > > > -           interrupts = <GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>;
> > > > -           ...
> > > > -   };
> > > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml b/Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml
> > > > new file mode 100644
> > > > index 000000000000..1e47c0cdc231
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml
> > > > @@ -0,0 +1,152 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > >
> > > Do you have rights to add BSD?
> > >
> >
> > My manager said we can submitted the DT schema bindings under both GPL and
> > BSD licenses. Though I don't know what license was of the legacy binding file.
> 
> Anything in the kernel without an explicit license is GPL-2.0-only.
> 
> > BTW Rob, you ask about the license very often whether I set pure GPL-2.0
> > or dual-license header. Just wondering is it some kind of protocol to make
> > sure a submitter has got proper rights to submit the binding?
> 
> New bindings should be dual GPL/BSD. Converted bindings should be
> relicensed if the authors of the original agree or you should maintain
> GPL-2.0-only.
> 
> Rob

Ah. ok. I didn't know that the legacy bindings have GPL-2.0 license by
default. Thanks. I'll keep it in mind in patchsets with bindings conversion.

Regards,
-Sergey
