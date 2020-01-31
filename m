Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6F5E14F53D
	for <lists+linux-rtc@lfdr.de>; Sat,  1 Feb 2020 00:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgAaXgf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 31 Jan 2020 18:36:35 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:46010 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgAaXge (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 31 Jan 2020 18:36:34 -0500
Received: by mail-il1-f195.google.com with SMTP id p8so7692129iln.12
        for <linux-rtc@vger.kernel.org>; Fri, 31 Jan 2020 15:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=wDLL4My23eSWC54SIryC2WamEFIBzKCY7R0WEz6+vZk=;
        b=dxbvuU9B+a6tqYbnM1Oy2U0EYOov/lcFBUp6z46xcc1euWUKhaodp53ITD2sMM7nt3
         Kas1wtSIc5+ennA0HxH2umvtybrrZoiNfxkqayyqdRCOhxtnEmFDTfEHogMe/1mDH3BF
         f7lFtmqyqTP6Wv2jwIWBmiMIdelwymbZiQWg1ZQet0bRdlwHGgDRQew60fl6cuNN2dsN
         Cookmet5xmY8R80NdlOm4xDJalUifwEcnL4pVUJbfEX5CrIR/ew253wtTSxWrDBbIGSw
         uhzfy7PNY77KEJOmegUHR6iyloXyvVwqVFpeuNjZLbNnPYNp9kt4DdYs1E/fuo6Tkm6e
         FcDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=wDLL4My23eSWC54SIryC2WamEFIBzKCY7R0WEz6+vZk=;
        b=YWSkESdkpdhlDm5/38PFZFv5J5F19p1g59rdj45MWlvEFv2xvxV7GYlaELmRkyq6XU
         hfOcZJ+4EgOfq8SIMisKYgXlW1gwPNRqVYTQzeI23GyBSo0i85eUy2lNbXzv7kh7yl74
         rD/wxyuaCxC7orti3kRQhCKFE42RZactdypCACVEa/2kL2VG6GjslP4XxNrXX79ho4ui
         8zjDeqv3+ceqnZ1LhcSRqDABtfimN8cDzqO960VBoVBCAOcSaFC5OYN4ZYUWuzpZSiYG
         Xry+/gphI9KAIgGRo8YbDPJJsF3Gzxuhk12TAl9tHJmXfm5V+U1IYyf+Q1qVmjV/XxmK
         GMJw==
X-Gm-Message-State: APjAAAV7vIje4lHmWm2GORj9SRKQac9TVAdlTrLD2ltdxbuZD2jk40Qc
        2eMvM4nWz2ui5cvUT/Mdn0kL2mE5yFug8ZvTE6ZtRTu8
X-Google-Smtp-Source: APXvYqzHxGpZfYVVowpF4duQaa+G0oJS7cpSA9YGStKNPRZWSa+fyHQ2ceJz7pgX2VIJtjUlVxfV5frCgH6IL+Exbjg=
X-Received: by 2002:a92:d5cf:: with SMTP id d15mr4890036ilq.306.1580513794338;
 Fri, 31 Jan 2020 15:36:34 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP; Fri, 31 Jan 2020 15:36:33
 -0800 (PST)
In-Reply-To: <20200131141324.GD3515@piout.net>
References: <CAA=hcWQcVi79AW9aOSGQSzEwL-sPwvt=4zR+_25mJKvbkBON1w@mail.gmail.com>
 <20200112110353.GC1253990@piout.net> <CAA=hcWQoY95oPbLYyD306_wxmj=GU57t8m-m_kWwyy5-7Quj=Q@mail.gmail.com>
 <20200130104756.GC3583@piout.net> <CAA=hcWQaDrAHnLJXjcfvbL_+HkZraqfbCA70rfsD4i5kqXOqOw@mail.gmail.com>
 <20200130144044.GG3583@piout.net> <CAA=hcWQoacmPsi-VH3B1BGFHJhHi1a-tLaJXBiwAn03E7BiTiQ@mail.gmail.com>
 <20200131141324.GD3515@piout.net>
From:   JH <jupiter.hce@gmail.com>
Date:   Sat, 1 Feb 2020 10:36:33 +1100
Message-ID: <CAA=hcWS3+eACAL5NHUX=Dc1DgbUor=g6mCNGFPK0Qc9-4u9uZQ@mail.gmail.com>
Subject: Re: rtc rtc0: Timeout trying to get valid LPSRT Counter read
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

On 2/1/20, Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
> On 31/01/2020 16:27:15+1100, JH wrote:
>> Hi Alexandre,
>>
>> On 1/31/20, Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
>> >> So it was already included in 4.19, I don't need to patch it, that is
>> >> good :-). Sorry I am still not clear how to stop that error message of
>> >> "rtc rtc0: Timeout trying to get valid LPSRT Counter read", the
>> >> message says "To avoid kernel hangs, put in timeouts", I am running
>> >> kernel 4.19.75 on iMX6, where should I put in timeouts?
>> >>
>> >
>> > The patch is adding the timeouts, without them, your kernel would be
>> > freezing. I'd say your issue is the 32k clock.
>>
>> Did you mean that is the issue of the hardware setup IMX6ULL for 32k
>> RTC_XTALI? That is nominal frequency 32.768 kHz for IMX6ULL EVK and
>> customized devices. Change to which frequency (64k?) can fix the
>> problem and remove the error message?
>>
>
> I can't help much more without seeing the schematics of your particular
> board. 32k is the correct frequency but are your sure it is going to the
> RTC? Are you sure you have power on VDD_SNVS_IN? Was there a security
> violation detected?

The XTALI and XTALO is connected to 24 MHz Y501 XTALI Oscillator, the
RTC_XTALI and RTC_XTALO is connected to Y502 32.768KHZ crystal. Don't
know about VDD_SNVS_IN,  The hardware was designed by an experienced
hardware engineers, I am not sure if they could make any silly
mistakes.


Thank you Alexandre,

Kind regards,

- jh
