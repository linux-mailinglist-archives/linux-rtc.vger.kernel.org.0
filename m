Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5F810CDE2
	for <lists+linux-rtc@lfdr.de>; Thu, 28 Nov 2019 18:30:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfK1RaC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 28 Nov 2019 12:30:02 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:37529 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbfK1RaC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 28 Nov 2019 12:30:02 -0500
X-Originating-IP: 90.65.102.129
Received: from localhost (lfbn-1-1480-129.w90-65.abo.wanadoo.fr [90.65.102.129])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 827F820013;
        Thu, 28 Nov 2019 17:29:59 +0000 (UTC)
Date:   Thu, 28 Nov 2019 18:29:57 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Cc:     Michal Simek <michal.simek@xilinx.com>, a.zummo@towertech.it,
        Srinivas Goud <sgoud@xilinx.com>, git@xilinx.com,
        linux-rtc@vger.kernel.org, champagne.guillaume.c@gmail.com,
        Maxime =?iso-8859-1?Q?Roussin-B=E9langer?= 
        <maxime.roussinbelanger@gmail.com>,
        Mathieu Gallichand <Mathieu.Gallichand@sonatest.com>
Subject: Re: [PATCH 2/2] rtc: zynqmp: fix invalid read_time before 1 second
Message-ID: <20191128172957.GS299836@piout.net>
References: <20191128015613.10003-1-jeff.dagenais@gmail.com>
 <20191128015613.10003-2-jeff.dagenais@gmail.com>
 <ca78b7e6-a0c3-745b-1533-6b8424d97623@xilinx.com>
 <CD70064B-5087-4A0F-9197-1F4A3DAA8B50@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CD70064B-5087-4A0F-9197-1F4A3DAA8B50@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 28/11/2019 11:04:19-0500, Jean-Francois Dagenais wrote:
> Hi Michal, all,
> 
> > On Nov 28, 2019, at 03:19, Michal Simek <michal.simek@xilinx.com> wrote:
> > 
> >> in CURRENT_TIME and proceeds to use SET_TIME_READ (RTC_SET_TM_RD in the
> >> code). This register contains garbage at this moment and this is
> >> returned as the current time.
> > 
> > How did you test this?
> 
> Remember the linux trampoline code... jumping from FSBL to the kernel without
> u-boot? Well, got it working and it speeds our boot substantially. This means we
> now reach rtc-zynqmp.c's probe within one second of power on. When we boot the
> board without a psbatt, and no internet connection (which means
> systemd-timesyncd cannot fix the bunkers date), we were ending up with a date in
> the very distant future (>50 years into the future). Aside from the date in our
> UI, all our SSL connections were failing because of certificate dates. This got
> our attention.
> 
> We drilled down quite a lot to find the real root cause. We used JTAG with xsct
> with our board simply powered on but not booted (bootselect SD without an SD
> card). This means no FSBL/psu_init code has run.
> 
> Exhibit A:
> 
> xsct% rrd rtc
>      set_time_write                  set_time_read: 00000000
>         calib_write                     calib_read: 00000000
>        current_time: 00000000                alarm: 00000000
>      rtc_int_status:       00         rtc_int_mask:       03
>          rtc_int_en                    rtc_int_dis
>          addr_error:       00  addr_error_int_mask:       01
>   addr_error_int_en             addr_error_int_dis
>             control: 01000000           safety_chk: 00000000
> 
> 
> Then we enable the RTC:
> 
> xsct% rwr rtc control 0x81000000
> 

Doesn't that enable battery switchover instead of simply enabling the
rtc, I though you didn't have a battery.

Or does that mean that your previous read of control returning bit 24
set is also bogus?

I ask because the simpler solution would simply to return -EINVAL in
xlnx_rtc_read_time when you detect a power on condition.

> The counter now counts, set_time_read and calib_read are garbage:
> xsct% rrd rtc
>      set_time_write                  set_time_read: fffe6bff
>         calib_write                     calib_read: 000f7fff
>        current_time: 00000002                alarm: 00000000
>      rtc_int_status:       01         rtc_int_mask:       03
>          rtc_int_en                    rtc_int_dis
>          addr_error:       00  addr_error_int_mask:       01
>   addr_error_int_en             addr_error_int_dis
>             control: 81000000           safety_chk: 00000000
> xsct% rrd rtc
>      set_time_write                  set_time_read: fffe6bff
>         calib_write                     calib_read: 000f7fff
>        current_time: 00000005                alarm: 00000000
>      rtc_int_status:       01         rtc_int_mask:       03
>          rtc_int_en                    rtc_int_dis
>          addr_error:       00  addr_error_int_mask:       01
>   addr_error_int_en             addr_error_int_dis
>             control: 81000000           safety_chk: 00000000
> xsct% rrd rtc
>      set_time_write                  set_time_read: fffe6bff
>         calib_write                     calib_read: 000f7fff
>        current_time: 00000008                alarm: 00000000
>      rtc_int_status:       01         rtc_int_mask:       03
>          rtc_int_en                    rtc_int_dis
>          addr_error:       00  addr_error_int_mask:       01
>   addr_error_int_en             addr_error_int_dis
>             control: 81000000           safety_chk: 00000000
> 
> We tested further, inserted a psbatt, enabled the RTC, but never touched
> set_time_write. Powered our board on and off. The observations is that that
> set_time_read and calib_read registers are not initialized to 0x0 upon power on.
> Once set though, they keep their values as long as the system is powered on or
> psbatt keeps the RTC alive. This is a contradiction of the register POR values
> specification.
> 
> So for rtc-zynqmp.c, it means that using the set_time_read register is a bad
> idea unless the code can definitely say that the set_time_write has been written
> to. And this is exactly what our patch does, by use of the seconds interrupt
> being enabled which signals the read_time() function that there is a pending
> write, and therefore the set_time_read can reliably be read.
> 
> Hope this helps!
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
