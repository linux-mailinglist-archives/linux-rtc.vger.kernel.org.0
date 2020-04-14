Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 501B91A7B23
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2020 14:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502191AbgDNMrs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 14 Apr 2020 08:47:48 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:60679 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502184AbgDNMrp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 14 Apr 2020 08:47:45 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id A6D5220000E;
        Tue, 14 Apr 2020 12:47:41 +0000 (UTC)
Date:   Tue, 14 Apr 2020 14:47:41 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Claudiu.Beznea@microchip.com
Cc:     a.zummo@towertech.it, robh+dt@kernel.org, mark.rutland@arm.com,
        Nicolas.Ferre@microchip.com, Ludovic.Desroches@microchip.com,
        tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] ARM: dts: sam9x60: add rtt
Message-ID: <20200414124741.GJ34509@piout.net>
References: <1586536019-12348-1-git-send-email-claudiu.beznea@microchip.com>
 <1586536019-12348-5-git-send-email-claudiu.beznea@microchip.com>
 <20200410222658.GB3628@piout.net>
 <c4d46198-488b-c5d6-2a66-865a16840dc4@microchip.com>
 <20200413104652.GE3628@piout.net>
 <3116d1fc-af96-1e0c-aa07-3b34cbd58209@microchip.com>
 <20200414111600.GE34509@piout.net>
 <a07d841e-efa9-6c01-69e2-0ed33f9759c5@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a07d841e-efa9-6c01-69e2-0ed33f9759c5@microchip.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 14/04/2020 12:13:46+0000, Claudiu.Beznea@microchip.com wrote:
> 
> 
> On 14.04.2020 14:16, Alexandre Belloni wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 14/04/2020 08:42:08+0000, Claudiu.Beznea@microchip.com wrote:
> >>> Why would one use the RTT while the RTC is far superior?
> >>
> >> I didn't enabled this for a particular use case, but: couldn't this be used
> >> by some user that wants to generate multiple alarms? from multiple RTCs?
> >>
> > 
> > I very much doubt that as Linux is able to properly multiplex alarms and
> > basically, the only one we are interested in is actually wakeup.
> 
> I think you can use the wakealarm sysfs exported file to prepare an alarm
> and take user space actions based on that without being suspended.
> 
> > 
> >> Moreover, this IP's counter has the possibility of being clocked at 1Hz.
> >> Couldn't this minimize the power consumption while being in a power saving
> >> mode?
> >>
> > 
> > And that 1Hz clock is coming from the RTC so using the RTC is
> > definitively consuming less power.
> 
> Datasheet specifies this: "Configuring the RTPRES field value to 0x8000
> (default value) corresponds to feeding the real-time counter with a
> 
> 1Hz signal (if the slow clock is 32.768 kHz)."
> 
> So, it is not the RTC, it is the slow clock divided by 32768.

This is not what you described previously, using RTPRES means running
the RTT at 32kHz. This is exactly what happens with the RTC but you get
the added clock calibration circuitry that is probably not drawing to
much power but the added consumption of the configurable prescaler
versus the static prescaler of the RTC is probably similar.

Using RTC1HZ would be driving the RTT at 1Hz.

> > But this is very unlikely to happen because this would be limited to a
> > single board device tree instead of impact every sam9x60 based boards.
> 
> Very unlikely but a having a patch with diff like this:
> 
> +&gpbr {
> +     status = "okay";
> +};
> +
> +&rtt {
> +     atmel,rtt-rtc-time-reg = <&gpbr 0x0>;
> +     status = "okay";
> +};
> +
> 
> and reverting it may affect the other users of gpbr in sam9x60ek.dts.
> 

Again, this affects only sam9x60ek.dts instead of possibly multiple DTs
that may be out of tree. So the risk of doing that is null.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
