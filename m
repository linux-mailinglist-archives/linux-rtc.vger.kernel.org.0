Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE4118D4D2
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Aug 2019 15:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727839AbfHNNey (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 14 Aug 2019 09:34:54 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43668 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727671AbfHNNex (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 14 Aug 2019 09:34:53 -0400
Received: by mail-pf1-f193.google.com with SMTP id v12so5801578pfn.10;
        Wed, 14 Aug 2019 06:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JMyzMSPAcHkH4e9Zgxpof5TsVyqF5zI/ain9gEP5KKg=;
        b=JANoGq/Sww+FYuUSnkZYkyk2pyEXMjgZkfwGwrwBbO25y3Is1s9yhfytEr+aT9Rv9g
         XOsO78b4jMadUYsrUHUZe9lHTU0SGMn2v9alqFOZfPXo4I3OE5TIS+Ho0clyAU++tcvw
         TU894hwi1enOdiGrQJpZhAs3V6LkUk4Du3+OUlDb9ooZOBoQIBfI1iueTfY3ZpFi9Rjl
         g+3d8kCJ5B1fszVNj7RjdYUwQ0FnXVeF6o8PCQOUcXUZoDVfWzsu8rZivBk4CniBTZA5
         0DG9OKL/ERpBwyLcAAqiPFL2rCyW1e88yeezAD3KvmOmlFMZa9LMhtjIVRg47y9kffNK
         p9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=JMyzMSPAcHkH4e9Zgxpof5TsVyqF5zI/ain9gEP5KKg=;
        b=tc1dy4u3iiALk2JS2mjhkgjmnYchqnOI38J0geR03jifj2rQfEfB7rp4bpSBn7svjK
         fkQBqGozh951jPvEXLoBAAKhKYJEPiCSX+y8vsHqetKCyrgS0a5oYuCtGGcEfcUQXdGW
         wcsIiLHzCTwpKrZh7qF0Vq5gVvLwTOF1tS7H1kTIy3wkXiVfeKjC3tkjZxp8y3ApBPxk
         wYxUMKpdoZU7DNSWraIZK1fP1skdPtS3lsWCNELTJwnfHYSfUmD88XA8wqPXrRhtZK14
         PCRmykRjkv2I1ai6QAQS1ofv7HodWNmxqWp6a2TS7aIgMP7urs/gSR8iwIIs9nsy9JNn
         p8lQ==
X-Gm-Message-State: APjAAAV/x9MywZcyqLUxnBS1BtQImfOTSAe4n4CzKNDYOxV/Bb54H0lo
        2ogm9oSCDTN+9Rb5IgIbp28=
X-Google-Smtp-Source: APXvYqz3Eue1lfZwbLHRIa4ZSakfMHxEq793gzh4tnValCkgylIVL0/7HCK2CiDDz8AanlIut3XnUA==
X-Received: by 2002:a62:f208:: with SMTP id m8mr11983926pfh.108.1565789693257;
        Wed, 14 Aug 2019 06:34:53 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ce7sm4731271pjb.16.2019.08.14.06.34.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Aug 2019 06:34:51 -0700 (PDT)
Date:   Wed, 14 Aug 2019 06:34:50 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        a.zummo@towertech.it, wim@linux-watchdog.org,
        u.kleine-koenig@pengutronix.de, bth@kamstrup.com
Subject: Re: [PATCH v2 4/5] rtc: pcf2127: add watchdog feature support
Message-ID: <20190814133450.GA32629@roeck-us.net>
References: <20190813153600.12406-1-bruno.thomsen@gmail.com>
 <20190813153600.12406-5-bruno.thomsen@gmail.com>
 <20190813161908.GA7857@roeck-us.net>
 <CAH+2xPDA4Ja_6Sgo0-Ak8KC5RKgE2E8CKyWargYaJMu52o_aoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH+2xPDA4Ja_6Sgo0-Ak8KC5RKgE2E8CKyWargYaJMu52o_aoA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Aug 14, 2019 at 03:25:55PM +0200, Bruno Thomsen wrote:
> Hi Guenter
> 
> Thanks for the quick review.
> 
> Den tir. 13. aug. 2019 kl. 18.19 skrev Guenter Roeck <linux@roeck-us.net>:
> >
> > On Tue, Aug 13, 2019 at 05:35:59PM +0200, Bruno Thomsen wrote:
> > > +static int pcf2127_wdt_start(struct watchdog_device *wdd)
> > > +{
> > > +     dev_info(wdd->parent, "watchdog enabled\n");
> > > +
> > > +     return pcf2127_wdt_ping(wdd);
> > > +}
> > > +
> > > +static int pcf2127_wdt_stop(struct watchdog_device *wdd)
> > > +{
> > > +     struct pcf2127 *pcf2127 = watchdog_get_drvdata(wdd);
> > > +
> > > +     dev_info(wdd->parent, "watchdog disabled\n");
> > > +
> >
> > There is a lot of noise in this driver. Please reconsider.
> 
> Would it be better if I remove the following lines:
> 
> dev_info(wdd->parent, "watchdog enabled\n");
> dev_info(wdd->parent, "watchdog disabled\n");
> dev_err(dev, "%s: watchdog registering failed\n", __func__);
> 
> and change this line to a dev_dbg():
> 
> dev_info(wdd->parent, "new watchdog timeout: %is (old: %is)\n",
>          new_timeout, wdd->timeout);
> 
> ?
> 
Yes.

Thanks,
Guenter
