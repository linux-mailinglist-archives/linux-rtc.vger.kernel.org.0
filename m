Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2D0F1F4958
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jun 2020 00:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728459AbgFIWYE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 9 Jun 2020 18:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728191AbgFIWYC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 9 Jun 2020 18:24:02 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 032A0C05BD1E
        for <linux-rtc@vger.kernel.org>; Tue,  9 Jun 2020 15:24:00 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id j12so285428lfh.0
        for <linux-rtc@vger.kernel.org>; Tue, 09 Jun 2020 15:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=km6g.us; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dKvNER5A2IjwZIxC0Xlq5AYP9JFJKTf7sG0leVqyGrc=;
        b=oaOHAz4dKwt88LzJ1VuawMYuOi7CgKdkOWayyJ+QbOEn/DxrkZDPjmgBlPltn0MKCu
         H1W4u8Epzv5jWO8f2wNpf0//ibtQYtMBEXuxCa9Cx1whHO3lx3FKNskAlnY1hhGrrLx+
         L2v5EYNNIciwj0dCDP90ZR7ySpvbQ0zGd1MY8N6uHgLgwYasPE1Ljxo6z22bzd2GmFOD
         NdbfDnAa6G7PZa7oEvWbU3NLQCAE9wQSquwiWJ0TtNP8CfHnWtLTBhnLJB537YVPM8nx
         xu0v7/5ckE0iUzGP7Ygxs94HQLM+lH+qeeXnGgTJ7f1G6fA3XD2TvHLYYB5qQ0yja6EB
         3Wnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dKvNER5A2IjwZIxC0Xlq5AYP9JFJKTf7sG0leVqyGrc=;
        b=AGU5GCW+CbAt8Aho0mqkzMLaI2mzjMOoU3Nzz4JpWKViUFeNVN8sP//nQ+PpD2VYac
         a1HLJFoiTNFbF0ZqoyVBrELEu9iSf5/2kW1F0AwkSwynyB9MHcRjv6GCi2qIypzeOooi
         Mcr5AvPdhB+gs1ZD5mqMek0KdL+6zY75qw3ci5ghp4RObWHj6A17w/hSHc3jxuKxG06R
         zFueNRjXBxnxKp+SE44/QTg47tazKOn7QUADzjVur6XpP7u2PlhT+hIRnyGysFHRnZtF
         b6v18895nWnd+mvzz/+RTWNeSgkyHULdZbWzlW/oijuskaNKL3SrTTvFk2cwfMqLJ4sz
         /wzQ==
X-Gm-Message-State: AOAM531W1XEhPVJXgn7umk4efp4Bz8HQqRYnSdtr8aZw7Kc10ogyTqzs
        nylrhP9OlsjoOYCfPAFgVaPM7gC6h5O91GUe+g7LFg==
X-Google-Smtp-Source: ABdhPJzPNL8NXYEPrzmlBn0JJ/YPzOMPrtv7DXBfa4e21zWSXb2c2IGQ2jq4fuvlYNhciR3LKtdCTrYMNq+y0ZJLbx8=
X-Received: by 2002:ac2:5a4c:: with SMTP id r12mr53671lfn.10.1591741439138;
 Tue, 09 Jun 2020 15:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200530123222.361104-1-kevin+linux@km6g.us> <20200609221401.GA1492918@bogus>
In-Reply-To: <20200609221401.GA1492918@bogus>
From:   "Kevin P. Fleming" <kevin+linux@km6g.us>
Date:   Tue, 9 Jun 2020 18:23:48 -0400
Message-ID: <CAE+UdorjD+2GORj3M6abgqTb8QnRZNFiyCX9PJAJc09xUBACqA@mail.gmail.com>
Subject: Re: [PATCH] rtc: abx80x: Add support for autocalibration filter capacitor
To:     Rob Herring <robh@kernel.org>
Cc:     "Kevin P. Fleming" <kevin+linux@km6g.us>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Jun 9, 2020 at 6:14 PM Rob Herring <robh@kernel.org> wrote:
> > ---
> >  .../bindings/rtc/abracon,abx80x.txt           |  6 ++++
> >  drivers/rtc/rtc-abx80x.c                      | 34 +++++++++++++++++++
> >  2 files changed, 40 insertions(+)
>
> Binding should be a separate patch?

Indeed, it was re-sent with the patches separated.

> > +All of the devices can have a 47pf capacitor attached to increase the
> > +autocalibration accuracy of their RC oscillators. To enable usage of the
> > +capacitor the following property has to be defined:
> > +
> > + - "abracon,autocal-filter"
>
> Can't the standard 'quartz-load-femtofarads' property be used here? You
> might not need to know the value, but presence of the property can
> enable the feature.

On these devices the capacitor is connected to the RC oscillator, not
the crystal oscillator, so this property is controlling a different
function. I'm certainly open to suggestions for different names for
the property if that is desired.
