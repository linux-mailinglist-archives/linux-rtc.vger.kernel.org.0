Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4B514D9BD
	for <lists+linux-rtc@lfdr.de>; Thu, 30 Jan 2020 12:27:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgA3L1i (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 30 Jan 2020 06:27:38 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:34317 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbgA3L1i (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 30 Jan 2020 06:27:38 -0500
Received: by mail-il1-f194.google.com with SMTP id l4so2778249ilj.1
        for <linux-rtc@vger.kernel.org>; Thu, 30 Jan 2020 03:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=nJIYiraISW8VM7xkiNqBeMsbTM5byiuUTlHquSVq+Bc=;
        b=OfC3ZbVjtN3ErLHN/HdoxQwxJs9WkH4YkhBLclB9WgKR7tY4RWRkI3vMj+HP6345+6
         kHFk3cz0d01bxN8ZKNzv+hvB1kY6AG+JdPSoIP9Wsa07A9Eyjuv2pgVmDsWj0Aa4TnIa
         s9kI9Mr7rQ77lJYlGKnIjS6GQSjnsBzU4n7njJfWLtGkRbLCLbkFg4dzC5gmM2Ga0VZp
         ByX20/Jzswvf2iPkn9pLq46qUymPnDURKvcOOUOSGzENpIYARunj9V1bbbs93g5K8IdE
         ojx2aGx2oH/g0ukY24J1NRM5fhx4ky/d0bi2NO6bZgawiPbZxxzhOXDQQWvbfRaGfO28
         SGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=nJIYiraISW8VM7xkiNqBeMsbTM5byiuUTlHquSVq+Bc=;
        b=huT0S17y5J97d8d94mH+SxBcUF2IJkneeZqgDA3oUNQZQMTmDjqULke+/mwoZOIP8v
         lTjwiur/iLcGav1lFxdpbEqyoguTjSm9sDr98gLecr/sisQRJ/Lh+92N5E1XxLPndAo/
         T3RsmSDo8cazQGsELNTh3FCXDhkyM5934VTz2qmbMtviPSP/Pk5S3AbI4tAQDOYU99ZP
         gGozR/Bpy8ZDZ3T7jSXZDZHN4qJ2wcJC68TmNao1y1+IfYMy/DvWNFFpbdzph+llk9DO
         OBvgNV1tpf0LDs3PR38o5wncXKhKcj/jo3ifL8l6C4fpLB/CTNgGNpk0jRE+2VpxHXE/
         LUqg==
X-Gm-Message-State: APjAAAXxlpdfcbgMM2kv+RslWECqhwuaZ+Xdn07JRBYbEQ7qn7OEvYCK
        5QD2x9OJbZxBSINWEa+LvoxiH6pQr51Fi19NU3ayLTn5
X-Google-Smtp-Source: APXvYqz37nlEt1wZC5QfpJscCdgzanZfV2zMT6Op+jjoqDIxKgNdp7cxjnZ+fJdfxoJl7+zbcgDPDRYh52X1dXKWfnk=
X-Received: by 2002:a92:390d:: with SMTP id g13mr3853758ila.53.1580383658047;
 Thu, 30 Jan 2020 03:27:38 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP; Thu, 30 Jan 2020 03:27:37
 -0800 (PST)
In-Reply-To: <20200130104756.GC3583@piout.net>
References: <CAA=hcWQcVi79AW9aOSGQSzEwL-sPwvt=4zR+_25mJKvbkBON1w@mail.gmail.com>
 <20200112110353.GC1253990@piout.net> <CAA=hcWQoY95oPbLYyD306_wxmj=GU57t8m-m_kWwyy5-7Quj=Q@mail.gmail.com>
 <20200130104756.GC3583@piout.net>
From:   JH <jupiter.hce@gmail.com>
Date:   Thu, 30 Jan 2020 22:27:37 +1100
Message-ID: <CAA=hcWQaDrAHnLJXjcfvbL_+HkZraqfbCA70rfsD4i5kqXOqOw@mail.gmail.com>
Subject: Re: rtc rtc0: Timeout trying to get valid LPSRT Counter read
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

On 1/30/20, Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
> On 30/01/2020 13:36:26+1100, JH wrote:
>> Hi Alexandre,
>>
>> Thanks for your response.
>>
>> On 1/12/20, Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
>> > Hi,
>> >
>> > On 02/01/2020 19:40:10+1100, JH wrote:
>> >> Hi,
>> >>
>> >> I am running kernel 4.19 on imx6, could anyone help for clues what
>> >> that error is about? What I could be missing and how to fix it?
>> >>
>> >
>> > I'd say that you have an issue with the 32k clock or tamper detection,
>> > have a look at this commit:
>> >
>> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cd7f3a249dbed2858e6c2f30e5be7f1f7a709ee2
>>
>> Is that a patch for 4.19.75? Or where can I download the patch for
>> 4.19.75?
>>
>
> This patch was included in 4.19. It introduced the message you are
> seeing and the commit message explains why you are seeing it.

So it was already included in 4.19, I don't need to patch it, that is
good :-). Sorry I am still not clear how to stop that error message of
"rtc rtc0: Timeout trying to get valid LPSRT Counter read", the
message says "To avoid kernel hangs, put in timeouts", I am running
kernel 4.19.75 on iMX6, where should I put in timeouts?

Thank you very much for your kind help.

Kind regards,

- jupiter
>
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
