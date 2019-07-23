Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9618271A04
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jul 2019 16:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390413AbfGWONa (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 23 Jul 2019 10:13:30 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:39225 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbfGWONa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 23 Jul 2019 10:13:30 -0400
Received: by mail-ed1-f68.google.com with SMTP id m10so44071917edv.6
        for <linux-rtc@vger.kernel.org>; Tue, 23 Jul 2019 07:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HAwiY1/rG8wJqQcR6j1V3fGMWcrvJx133OcdyAaU2eg=;
        b=oQReH2L+GF4BKa+PtWvuivxhyPuExJzU7cdq1I0SQ9IhOzl4DWZ9hmeIlEO6/Rx4Xu
         +KOJNBuRqhkD4HTRDYGyDZ4aMFITlgRXBNJu5EUniaT9x3Ov6shUeurYcJlm/tAJFOLO
         RV9Cv2jdhfdSiYZSEVsvcZYHWg2rAefKZaUmMR1PHZoTAbf8FRKqwxVSeimdAMLTkke5
         PSyK99KdZ5f19+gQgIsa3hzSTlMZ60QNeXMrD+NHmBmDJM5CPrcMO5RlbvU1/psGS0vJ
         H8WUqcFHcWY/i2tmUJGolza7sIwWmwESkEePLggVRTqZ7ujmpfh4TuUAm162x5163iDe
         4IJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HAwiY1/rG8wJqQcR6j1V3fGMWcrvJx133OcdyAaU2eg=;
        b=reZ+MwBjg3OPRAE88bNXoocp6782Sio7i4sauj0/63xACkdjTQA5dFSbuieEnS0QdH
         VhPIpi9eDGoPg/oHH9VsHVQuvnOER0FqpbdPkHdYIvKTKNIuSmRU9A+JAfz7LepVGr/c
         w/0zO5xP3Z3vYOVnl2yFcxg/kd2gJCK5+FG9Wb8j9Y/r/qv/toXFe83CiXNOszR/5Ova
         r2OCNSr2jBpSAL1BSDvwkRzGzr/SiREEw31DMZU3StMioICwtt0W6RiRmaqUdL2DrVok
         s52TlU5ide615Yho40i2nCV3tBF+f+1ZVb/JNdtRuPUhNU4aw1BpHAGZY+H8P44sEw2i
         VZyQ==
X-Gm-Message-State: APjAAAUNkv8LKKWjqrkEYwEElB1ozV7I6TBrZE4+itu8Mka4LV/fIZur
        m6JrQy0iSFNFgCgNmnjcQeqvVDY8sd6Y1+iX62ORXDqZWTk=
X-Google-Smtp-Source: APXvYqxI/BYOld3LtRQkgwjP1416koNclTQAf1tUKlNvIN97wRRvjKRp7jue1bZ+8SZx2Vt3N1gt4/eymwC+em58uZw=
X-Received: by 2002:aa7:d781:: with SMTP id s1mr20617884edq.20.1563891208250;
 Tue, 23 Jul 2019 07:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190722155811.11980-1-bruno.thomsen@gmail.com>
In-Reply-To: <20190722155811.11980-1-bruno.thomsen@gmail.com>
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
Date:   Tue, 23 Jul 2019 16:13:12 +0200
Message-ID: <CAH+2xPB7y703-WeiNBRoDXfWPKTRMzD=a5P+EYohYmV46BS2ZA@mail.gmail.com>
Subject: Re: [PATCH 0/4] rtc: pcf2127: tamper timestamp and watchdog feature support
To:     linux-rtc@vger.kernel.org
Cc:     alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        bth@kamstrup.com, u.kleine-koenig@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi all

> Patches has been tested on a pcf2127 chip using 2MHz SPI
> interface both as built-in and module including with and
> without watchdog feature.

I did some more testing as I could not understand this bugfix:

3769a375ab83 rtc: pcf2127: bulk read only date and time registers.

This fix seems to be incomplete as root cause is not auto-increment
read aka bulk read, but reading control register 2 triggers zero value
in WD_VAL resulting in stopped watchdog until systemd kick the dog
again :)

As the watchdog has 2 control registers I will do some more testing
to see if this also apply to the other register. But more importantly
this issue also affect timestamp0_{store,show} functions in tamper
detection support, and I will therefor send a v2 of the patch series.

/Bruno
