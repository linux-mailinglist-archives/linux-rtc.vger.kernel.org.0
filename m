Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D397E2391
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Oct 2019 22:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404176AbfJWUBi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 23 Oct 2019 16:01:38 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:57269 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733176AbfJWUBi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 23 Oct 2019 16:01:38 -0400
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id EF7A660006;
        Wed, 23 Oct 2019 20:01:35 +0000 (UTC)
Date:   Wed, 23 Oct 2019 22:01:35 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     "Luck, Tony" <tony.luck@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        linux-ia64@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
        Stephane Eranian <eranian@google.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc/ia64: remove legacy efirtc driver
Message-ID: <20191023200135.GT3125@piout.net>
References: <20191023150311.844123-1-arnd@arndb.de>
 <20191023184616.GA17078@agluck-desk2.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023184616.GA17078@agluck-desk2.amr.corp.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 23/10/2019 11:46:16-0700, Luck, Tony wrote:
> On Wed, Oct 23, 2019 at 05:01:58PM +0200, Arnd Bergmann wrote:
> > There are two EFI RTC drivers, the original drivers/char/efirtc.c
> > driver and the more modern drivers/rtc/rtc-efi.c.
> > 
> > Both implement the same interface, but the new one does so
> > in a more portable way.
> > 
> > Move everything over to that one and remove the old one.
> 
> The new one is more talkative that the old one. I see this extra
> line on the console when I boot ia64:
> 
> rtc-efi rtc-efi: setting system clock to 2019-10-23T18:30:23 UTC (1571855423)
> 
> That seems somewhat useful & informative (though the repeated "rtc-efi"
> at the start of the line is redundant).
> 

You can remove CONFIG_RTC_HCTOSYS, this line will disappear, systemd
will not like that but efirtc was not setting the system time anyway so
this shouldn't change the behaviour.

The redundancy in the log is kind of specific to this RTC. For CMOS,
this is: rtc_cmos 00:01, it should identify the RTC uniquely.

> Acked-by: Tony Luck <tony.luck@intel.com>
> 
> -Tony

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
