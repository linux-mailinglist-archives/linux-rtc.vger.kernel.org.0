Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 913EF9CD08
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2019 12:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730036AbfHZKGx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 26 Aug 2019 06:06:53 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:47401 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729563AbfHZKGx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 26 Aug 2019 06:06:53 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 0A522E0002;
        Mon, 26 Aug 2019 10:06:50 +0000 (UTC)
Date:   Mon, 26 Aug 2019 12:06:50 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Biwen Li <biwen.li@nxp.com>
Cc:     Nandor Han <nandor.han@vaisala.com>, Leo Li <leoyang.li@nxp.com>,
        Mark Brown <broonie@kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [EXT] Re: [v2] rtc: pcf85363/pcf85263: fix error that failed to
 run hwclock -w
Message-ID: <20190826100650.GB21713@piout.net>
References: <20190816024636.34738-1-biwen.li@nxp.com>
 <20190816080417.GB3545@piout.net>
 <CADRPPNRkqbWzGEvUJyi0Qff3oS6biO0v7BTrK1Jiz9AMnOYF=Q@mail.gmail.com>
 <20190816162825.GE3545@piout.net>
 <CADRPPNQwcGrVXLm8eHbXKmyecMhT6Mt9rNGnspJA1+MnV4K8oQ@mail.gmail.com>
 <ff198737-acb5-7186-7e14-a1e1cdc0f72c@vaisala.com>
 <DB7PR04MB4490614205732E4508B8A8B38FA10@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <21f417e3-db50-5930-ddc9-eed54f5d5893@vaisala.com>
 <DB7PR04MB449081DBB762BB30E2C55F638FA10@DB7PR04MB4490.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB7PR04MB449081DBB762BB30E2C55F638FA10@DB7PR04MB4490.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 26/08/2019 09:49:49+0000, Biwen Li wrote:
> > 
> > On 8/26/19 7:29 AM, Biwen Li wrote:
> > >>
> > >> On 8/16/19 10:40 PM, Li Yang wrote:
> > >>> On Fri, Aug 16, 2019 at 11:30 AM Alexandre Belloni
> > >>> <alexandre.belloni@bootlin.com> wrote:
> > >>>>
> > >>>> On 16/08/2019 10:50:49-0500, Li Yang wrote:
> > >>>>> On Fri, Aug 16, 2019 at 3:05 AM Alexandre Belloni
> > >>>>> <alexandre.belloni@bootlin.com> wrote:
> > >>>>>>
> > >>>>>> On 16/08/2019 10:46:36+0800, Biwen Li wrote:
> > >>>>>>> Issue:
> > >>>>>>>       - # hwclock -w
> > >>>>>>>         hwclock: RTC_SET_TIME: Invalid argument
> > >>>>>>>
> > >>>>>>> Why:
> > >>>>>>>       - Relative patch:
> > >> https://lkml.org
> > >> %2Flkml%2F2019%2F4%2F3%2F55&amp;data=02%7C01%7Cbiwen.li%40n
> > xp.
> > >>
> > com%7Cff8cebc3f1034ae3fa9608d725ff9e5e%7C686ea1d3bc2b4c6fa92cd99
> > >>
> > c5c301635%7C0%7C0%7C637019652111923736&amp;sdata=spY6e22YOkOF
> > >> 3%2BF7crSM0M6xPmOhgULDqMZLQw%2BAmdI%3D&amp;reserved=0 ,
> > this patch
> > >>>>>>>         will always check for unwritable registers, it will compare reg
> > >>>>>>>         with max_register in regmap_writeable.
> > >>>>>>>
> > >>>>>>>       - In drivers/rtc/rtc-pcf85363.c, CTRL_STOP_EN is 0x2e, but
> > >> DT_100THS
> > >>>>>>>         is 0, max_regiter is 0x2f, then reg will be equal to 0x30,
> > >>>>>>>         '0x30 < 0x2f' is false,so regmap_writeable will return false.
> > >>>>>>>
> > >>>>>>>       - Root cause: the buf[] was written to a wrong place in the file
> > >>>>>>>         drivers/rtc/rtc-pcf85363.c
> > >>>>>>>
> > >>>>>>
> > >>>>>> This is not true, the RTC wraps the register accesses properly
> > >>>>>> and this
> > >>>>>
> > >>>>> This performance hack probably deserve some explanation in the
> > >>>>> code comment.  :)
> > >>>>>
> > >>>>>> is probably something that should be handled by regmap_writable.
> > >>>>>
> > >>>>> The address wrapping is specific to this RTC chip.  Is it also
> > >>>>> commonly used by other I2C devices?  I'm not sure if
> > >>>>> regmap_writable should handle the wrapping case if it is too special.
> > >>>>>
> > >>>>
> > >>>> Most of the i2c RTCs do address wrapping which is sometimes the
> > >>>> only way to properly set the time.
> > >>>
> > >>> Adding Mark and Nandor to the loop.
> > >>>
> > >>> Regards,
> > >>> Leo
> > >>>
> > >>
> > >> Hi,
> > >>     `regmap` provides couple of ways to validate the registers:
> > >> max_register, callback function and write table. All of these are
> > >> optional, so it gives you the freedom to customize it as needed.
> > >>
> > >> In this situation probably you could:
> > >>     1. Avoid using the wrapping feature of pcf85363 (you can just
> > >> provide separate calls for stop, reset and time confguration). In
> > >> this way the `max_register` validation method will work fine.
> > > Yes, I use this way. Path as follows:
> > > Stop and reset - > set time > stop
> > >
> > 
> > Some of the concerns regarding this method was that it might not be precise
> > enough. That because you need 2 I2C operations (one for stop and one for time
> > configuration). Not sure about your case if this is a problem or not.
> Ok, got it, thanks.

To be clear, for this RTC it is fine to separate both writes. Want I
want is a corrected commit message with a proper reference to
8b9f9d4dc511309918c4f6793bae7387c0c638af instead of a link to lkml.org
and a proper explanation.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
