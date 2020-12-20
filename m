Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 509882DF66F
	for <lists+linux-rtc@lfdr.de>; Sun, 20 Dec 2020 19:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbgLTSSp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 20 Dec 2020 13:18:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbgLTSSo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 20 Dec 2020 13:18:44 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29D8EC061285
        for <linux-rtc@vger.kernel.org>; Sun, 20 Dec 2020 10:18:02 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id h205so18369686lfd.5
        for <linux-rtc@vger.kernel.org>; Sun, 20 Dec 2020 10:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wpfdwLLEz57xZZQ6pUnIHIytbIt7sjGYXR5+reagHWc=;
        b=QRXq9LNWPBFL2tt01fR8hkq2opbGjD4Q5IX2Pc2U0rBnz2RyBAq6V9DP4Gq/fun0Uq
         x5O6aOSH6Z+7bkrfX8cf7NMYEoGy5661pWF7OVhhieMf3amif6cUjqoZDw82DPcjAiVY
         c+O+aIFvlYgYE9weGEVvhw2z8I0pdpCr7Tz/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wpfdwLLEz57xZZQ6pUnIHIytbIt7sjGYXR5+reagHWc=;
        b=VkLQE2qyf9Wb/C+vFnq7TCAUvw5ywPxRFmUREnDkjiHHWVwR+CpI7NgONPrct7JMPY
         SQ56nWIpFzx7ssM3smHDeYXYCQMhXUU94SOi8owmrTpgh79ZbkMRXATFy1YfwF1lz49B
         dgiDW9wAN5iPdS/LJzqrwJnNa7tjwx4d9J83415wYmp72/Q3zes44FsqboBn5UMIMRDV
         Fcy3aVhQ6uyK8avZ80Fa+/wmonPsIPliA2WPPMhSrHJhX0bCqGc5NF1eOXU/YYmmr3vn
         ThB14R+Zewp+dt9NYfGaqz72e8ougMY0aExt8Dg1pheCNdtfPa+6940vAc0LwHKm11DK
         5P3Q==
X-Gm-Message-State: AOAM530tQflRPLp2CBc2U/c87MHHpbrl1BTG9UPbfqbLTNLV1+AZg8wD
        2L5D9klSsDaKMwtb0pJ7KgzLX7z2YXEZyg==
X-Google-Smtp-Source: ABdhPJz+ZhZaTfqZnVhCJdNhxQNU27SKYYo2G3GPgH8g+hWY4gbP1YPsDtCpHKTTIA0IgVhNeu3v5w==
X-Received: by 2002:ac2:5b1e:: with SMTP id v30mr5589499lfn.540.1608488280318;
        Sun, 20 Dec 2020 10:18:00 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id h23sm1876095ljh.115.2020.12.20.10.17.59
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Dec 2020 10:17:59 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id m25so18302825lfc.11
        for <linux-rtc@vger.kernel.org>; Sun, 20 Dec 2020 10:17:59 -0800 (PST)
X-Received: by 2002:ac2:4987:: with SMTP id f7mr4920781lfl.41.1608488279126;
 Sun, 20 Dec 2020 10:17:59 -0800 (PST)
MIME-Version: 1.0
References: <20201219221254.GA3604939@piout.net>
In-Reply-To: <20201219221254.GA3604939@piout.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 20 Dec 2020 10:17:43 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjOamRwdUH6JSBSeT80XEKdzrEDWY59RPnLbAyjPh4nWw@mail.gmail.com>
Message-ID: <CAHk-=wjOamRwdUH6JSBSeT80XEKdzrEDWY59RPnLbAyjPh4nWw@mail.gmail.com>
Subject: Re: [GIT PULL] RTC for 5.11
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, Dec 19, 2020 at 2:12 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Here is the RTC pull request for 5.11. There is a non trivial conflict
> with the tip tree in include/linux/rtc.h.

Heh. That was actually a trivial one - just changes next to each
other, nothing odd.

It just looked scary because of one side of the change involved code
movement, so the conflict diff ended up being big.

But it wasn't actually a bad conflict - I spent more time looking for
that "non trivial" part you warned about than I spent on the conflict
itself ;)

                  Linus
