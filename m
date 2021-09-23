Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B356B416374
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Sep 2021 18:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233964AbhIWQlL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 23 Sep 2021 12:41:11 -0400
Received: from mout01.posteo.de ([185.67.36.65]:39127 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233635AbhIWQlL (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 23 Sep 2021 12:41:11 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 8EFB2240028
        for <linux-rtc@vger.kernel.org>; Thu, 23 Sep 2021 18:39:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1632415177; bh=JfaYUfRZS79mDdN7aSoR4XEwe4ueYpxquoUGhyEpO/U=;
        h=Date:From:To:Cc:Subject:From;
        b=pu1I434ATd2EYnaNHLRWwVS3FUmEtW232KXmoCzvHIGrI9TgojkdutdVObhDu/eOT
         kVqrK4dvePuHYD6E5nBCNWI3t+O8wJ3fGaB8vwQZr6aV44G8/gwZ0J4ZYmTn44mc7O
         kxq36X1ul14YX5hbeELkwgROjC+YAoXiinxh1wiHhP8/fT2PoVkcvTfUERW3or6GIk
         XG29wPpkJ0Kpm+ddQAF4ITyLKP5XY4/xBrqKSikRB/qkRmiZypnpr33hpbvnBnUPj/
         b8EdQ+WXPUWqp6/1LgHocRGilmO+kx5EYgRNMlzW2L/DduPBh04gFoeAfLudNHM1Ti
         xvF3PH1v1SAyQ==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4HFgqX2ZJKz9rxD;
        Thu, 23 Sep 2021 18:39:36 +0200 (CEST)
Date:   Thu, 23 Sep 2021 16:39:34 +0000
From:   Wilken Gottwalt <wilken.gottwalt@posteo.net>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Joerg Reiling <joerg.reiling@jenoptik.com>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: rtc-isl12022: add isl12020 device support
Message-ID: <20210923183934.09cfb251@monster.powergraphx.local>
In-Reply-To: <YUyfF5VRfOkdC4wn@piout.net>
References: <YUx43WuvwrYIvjxe@monster.powergraphx.local>
        <YUyfF5VRfOkdC4wn@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 23 Sep 2021 17:36:55 +0200
Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:

> Hi,
> 
> On 23/09/2021 12:53:49+0000, Wilken Gottwalt wrote:
> > Adds the isl12020 device, which is fully compatible to isl12022.
> > 
> 
> Do you know what is differing between both parts? If there is nothing
> relevant to linux, maybe we could just avoid adding a new compatible
> string.

Hmm no, there are no changes relevant for a driver. So yeah, you are
right, that only would add the possibility to use isl12020 in the device
tree instead of isl12022. Oh boy, this is kind of embarrassing, just
didn't think about it. ;-) But there will be more patches, the chip
also have temp sensor exposable by hwmon.

> > Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
> > Signed-off-by: Joerg Reiling <joerg.reiling@jenoptik.com>
> > ---
> >  drivers/rtc/rtc-isl12022.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
> > index 961bd5d1d109..c62770ec99c9 100644
> > --- a/drivers/rtc/rtc-isl12022.c
> > +++ b/drivers/rtc/rtc-isl12022.c
> > @@ -257,6 +257,8 @@ static int isl12022_probe(struct i2c_client *client,
> >  static const struct of_device_id isl12022_dt_match[] = {
> >  	{ .compatible = "isl,isl12022" }, /* for backward compat., don't use */
> >  	{ .compatible = "isil,isl12022" },
> > +	{ .compatible = "isl,isl12020" }, /* for backward compat., don't use */
> 
> Please, do not add this compatible string.
> 
> > +	{ .compatible = "isil,isl12020" },
> 
> You also need to document this string in Documentation/devicetree/bindings/rtc/trivial-rtc.yaml

I only checked the isl* bindings. Why is there no specific isl12022 yaml
file like the other isl* chips have?

> >  	{ },
> >  };
> >  MODULE_DEVICE_TABLE(of, isl12022_dt_match);
> > @@ -264,6 +266,7 @@ MODULE_DEVICE_TABLE(of, isl12022_dt_match);
> >  
> >  static const struct i2c_device_id isl12022_id[] = {
> >  	{ "isl12022", 0 },
> > +	{ "isl12020", 0 },
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(i2c, isl12022_id);
> > -- 
> > 2.33.0
> > 
> 

