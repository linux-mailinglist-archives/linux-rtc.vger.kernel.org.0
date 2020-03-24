Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5003F191880
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Mar 2020 19:08:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727665AbgCXSHO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 24 Mar 2020 14:07:14 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:33159 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727611AbgCXSHO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 24 Mar 2020 14:07:14 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 77F59C000B;
        Tue, 24 Mar 2020 18:07:09 +0000 (UTC)
Date:   Tue, 24 Mar 2020 19:07:09 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Sergey.Semin@baikalelectronics.ru
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: rtc: Convert snps,dw-apb-timer to DT
 schema
Message-ID: <20200324180709.GO5504@piout.net>
References: <20200306125622.839ED80307C4@mail.baikalelectronics.ru>
 <20200324174325.14213-1-Sergey.Semin@baikalelectronics.ru>
 <20200324174325.14213-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324174325.14213-2-Sergey.Semin@baikalelectronics.ru>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 24/03/2020 20:43:20+0300, Sergey.Semin@baikalelectronics.ru wrote:
> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> Modern device tree bindings are supposed to be created as YAML-files
> in accordance with DT schema. This commit replaces Synopsys DW Timer
> legacy bare text binding with YAML file. As before the binding file
> states that the corresponding dts node is supposed to be compatible
> with generic DW APB Timer indicated by the "snps,dw-apb-timer"
> compatible string and to provide a mandatory registers memory range,
> one timer interrupt, either reference clock source or a fixed clock
> rate value. It may also have an optional APB bus reference clock
> phandle specified.
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
> I have doubts that this binding file belongs to the bindings/rtc
> directory seeing it's a pure timer with no rtc facilities like
> days/months/years counting and alarms. What about moving it to the
> "Documentation/devicetree/bindings/timer/" directory?
> 

Exactly my reaction when seeing the patch, please move it out of
bindings/rtc/


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
