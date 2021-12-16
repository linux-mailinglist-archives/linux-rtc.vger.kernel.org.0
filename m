Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28938477DF2
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Dec 2021 21:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234088AbhLPU4K (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 16 Dec 2021 15:56:10 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:43837 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234048AbhLPU4K (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 16 Dec 2021 15:56:10 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 3749240004;
        Thu, 16 Dec 2021 20:56:07 +0000 (UTC)
Date:   Thu, 16 Dec 2021 21:56:06 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.ne@posteo.net>,
        linux-rtc@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linuxppc-dev@lists.ozlabs.org, Ash Logan <ash@heyquark.com>,
        rw-r-r-0644 <r.r.qwertyuiop.r.r@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v3 0/5] rtc: nintendo: Add a RTC driver for the GameCube,
 Wii and Wii U
Message-ID: <Ybun5qp6DH7qkAGy@piout.net>
References: <20211027223516.2031-1-linkmauve@linkmauve.fr>
 <20211215175501.6761-1-linkmauve@linkmauve.fr>
 <163964813197.6786.14005810276404182021.b4-ty@bootlin.com>
 <20211216202220.y6rctd2k72yuya5w@luna>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211216202220.y6rctd2k72yuya5w@luna>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 16/12/2021 21:22:20+0100, Emmanuel Gil Peyrot wrote:
> On Thu, Dec 16, 2021 at 10:49:44AM +0100, Alexandre Belloni wrote:
> > On Wed, 15 Dec 2021 18:54:56 +0100, Emmanuel Gil Peyrot wrote:
> > > These three consoles share a device, the MX23L4005, which contains a
> > > clock and 64 bytes of SRAM storage, and is exposed on the EXI bus
> > > (similar to SPI) on channel 0, device 1.  This driver allows it to be
> > > used as a Linux RTC device, where time can be read and set.
> > > 
> > > The hardware also exposes two timers, one which shuts down the console
> > > and one which powers it on, but these aren’t supported currently.
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/5] rtc: gamecube: Add a RTC driver for the GameCube, Wii and Wii U
> >       commit: 86559400b3ef9de93ba50523cffe767c35cd531a
> > [2/5] rtc: gamecube: Report low battery as invalid data
> >       commit: 322539a014bcd24cbb9281832c09b24e07912237
> > [3/5] powerpc: wii.dts: Expose HW_SRNPROT on this platform
> >       commit: 5479618e1e2641dd57352a73b7b7b2f6908fbeee
> > [4/5] powerpc: gamecube_defconfig: Enable the RTC driver
> >       commit: 57bd7d356506b713d0df8d8e42da7810a18864df
> > [5/5] powerpc: wii_defconfig: Enable the RTC driver
> >       commit: 69e8ba80ddda4db31e59facbf2db19773ad3785b
> > 
> > This one didn't apply ceanly but I believe I did the right thing. Can you check?
> 
> I believe you didn’t, at least that commit[1] seems to have one “+” too
> many in the modified line, whereas the previous one[2] doesn’t.
> 

I knew I needed you to check, this is fixed now.

https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git/commit/?id=c636783d594f6cfc95db51c796761719317ce5eb


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
