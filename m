Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 830872B783A
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Nov 2020 09:14:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgKRINe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 18 Nov 2020 03:13:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbgKRINd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 18 Nov 2020 03:13:33 -0500
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 658BDC061A4D
        for <linux-rtc@vger.kernel.org>; Wed, 18 Nov 2020 00:13:32 -0800 (PST)
Received: by mail-il1-x141.google.com with SMTP id q1so1181425ilt.6
        for <linux-rtc@vger.kernel.org>; Wed, 18 Nov 2020 00:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ct2/2UPmScOUHoGSFzqsn+7XRR4T7u7W+vJi+oyfibI=;
        b=xCfFu4o6WMketFkqkuTIIz+3Wiv5cWWXrj1S2aceMLkMtlicKTS2/Kh9oLrgN2L31v
         +UFYmpcOCNpv8IRzxoSWJmf2D46PdxVqLN+VzrimBXlKs8+4ztUY6o3YbUU//P5UNQIE
         WgA2gaolRxkgqym3V9fwVB4aNRkfAIHWQpm8EjlYGXQI3lhD9hb1BUKViXgdh9SsWKO1
         P5szDGnkBjEYMWK1vsf5UKVrwmBQurP2mN66xkKZMlMC3ugCxOJp9C43Qbof/CFW8u93
         iakqOIkV3PeQj8ao2DwogPSuFJgjNx+6sv65bdI+COJWd2oY/5sM2t2eJhyUyUsrnRcD
         kILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ct2/2UPmScOUHoGSFzqsn+7XRR4T7u7W+vJi+oyfibI=;
        b=unK8QkClevTY00s+fSbr6hgO3IdMpoOAqeju40FsRFvK4TGsduf5X2iv/pQDc4V7Xx
         +H0GC7gmHq8ZsFQ3VTGJcVGRkFRt3dErZQRgGBv1/p3CIlQoGM3U7ccGVXAFo3S5FKXs
         KBf1jI94ms9HwSa/L2lCNDHDw6iz6P0qFvSRRp4WjDklLxZUzUA0yuK8Uixh0Tam3Qha
         zt37yG3yp9rZE9Kz3B1xEadvbZFsPXWi/aP1Ghi1rNZoforBFAMC7DA2xjIXy5sbYvi9
         7L6Lsh5kH0a6DupeUnyTqT8qghwg99/M0WpsOzXMc9BIBo7awmt4wK3/9E5gxWcxXGRs
         fRjg==
X-Gm-Message-State: AOAM5324ZzaC4C+osvOvp98dbAqlkyCIhMygMTvTcBCl93OZsHIZXZWz
        0KDlHjZbaGtm47IZ3l9PP/cNCQSOiHVxVz0QA88gTA==
X-Google-Smtp-Source: ABdhPJyHoLe2SGc5qXcATM+IxxK3upGdnejUFDgJuR/1q5lYaJyQho0GdhOn8kGjlV2KbzTeVFSdYoWDm9Ax9wHbC10=
X-Received: by 2002:a92:d78b:: with SMTP id d11mr13538859iln.40.1605687211707;
 Wed, 18 Nov 2020 00:13:31 -0800 (PST)
MIME-Version: 1.0
References: <20201109163409.24301-1-brgl@bgdev.pl> <20201109163409.24301-8-brgl@bgdev.pl>
 <20201117213504.GY4556@piout.net>
In-Reply-To: <20201117213504.GY4556@piout.net>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 18 Nov 2020 09:13:20 +0100
Message-ID: <CAMRc=MehmRGRi=f=xrY498VdQdveLES+bmptvc3rA05ja56HFQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] rtc: rework rtc_register_device() resource management
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Nov 17, 2020 at 10:35 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 09/11/2020 17:34:08+0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > rtc_register_device() is a managed interface but it doesn't use devres
> > by itself - instead it marks an rtc_device as "registered" and the devres
> > callback for devm_rtc_allocate_device() takes care of resource release.
> >
> > This doesn't correspond with the design behind devres where managed
> > structures should not be aware of being managed. The correct solution
> > here is to register a separate devres callback for unregistering the
> > device.
> >
> > While at it: rename rtc_register_device() to devm_rtc_register_device()
> > and add it to the list of managed interfaces in devres.rst. This way we
> > can avoid any potential confusion of driver developers who may expect
> > there to exist a corresponding unregister function.
> >
>
> I'm going to apply that but honestly, I don't like the fact that we now
> end up with both devm_rtc_device_register and devm_rtc_register_device.
> This was the main reason to not have the devm_ prefix there. I find that
> way more confusing than the current situation.
>

Yes, it's unfortunate that we have two similarly named functions but
devm_rtc_device_register() is deprecated and should go away right? In
that case it's just temporary. Additionally: since it's just a wrapper
around devm_rtc_allocate_device() and devm_rtc_register_device() now,
we should be able to just replace the code in the drivers with the
code from devm_rtc_device_register() and we may be able to get rid of
it soon?

Bartosz
