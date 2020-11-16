Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EDC52B4954
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Nov 2020 16:31:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731058AbgKPPaj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Nov 2020 10:30:39 -0500
Received: from david.siemens.de ([192.35.17.14]:45163 "EHLO david.siemens.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728029AbgKPPaj (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 16 Nov 2020 10:30:39 -0500
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0AGFUPI4013349
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 16 Nov 2020 16:30:25 +0100
Received: from md1za8fc.ad001.siemens.net ([167.87.8.227])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0AGFUO1C017376;
        Mon, 16 Nov 2020 16:30:24 +0100
Date:   Mon, 16 Nov 2020 16:30:24 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Claudius Heine <ch@denx.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Johannes Hahn <johannes-hahn@siemens.com>,
        "Zeh, Werner" <werner.zeh@siemens.com>
Subject: Re: [PATCH v2 2/3] rtc: rx6110: add ACPI bindings to I2C
Message-ID: <20201116163024.74c767b6@md1za8fc.ad001.siemens.net>
In-Reply-To: <20201116144631.GB1689012@smile.fi.intel.com>
References: <20201112130734.331094-1-ch@denx.de>
        <20201112130734.331094-3-ch@denx.de>
        <20201116144631.GB1689012@smile.fi.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Am Mon, 16 Nov 2020 16:46:31 +0200
schrieb Andy Shevchenko <andriy.shevchenko@intel.com>:

> On Thu, Nov 12, 2020 at 02:07:33PM +0100, Claudius Heine wrote:
> > From: Johannes Hahn <johannes-hahn@siemens.com>
> > 
> > This allows the RX6110 driver to be automatically assigned to the
> > right device on the I2C bus.  
> 
> Before adding new ACPI ID, can you provide an evidence (either from
> vendor of the component, or a real snapshot of DSDT from device on
> market) that this is real ID?
> 
> Before that happens, NAK.
> 
> P.S. Seems to me that this is kinda cargo cult patch because proposed
> ID is against ACPI and PNP registry and ACPI specification.

In fact we pushed it in coreboot and Linux at the same time.

https://review.coreboot.org/c/coreboot/+/47235

That is the evidence. But in case this is wrong we can probably still
change coreboot, even though the patches have been merged there already.

Maybe you can go into detail where you see the violations and maybe
even suggest fixes that come to mind.

Henning
