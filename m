Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 621DA107DEE
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Nov 2019 10:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbfKWJk0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 23 Nov 2019 04:40:26 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44039 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfKWJk0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 23 Nov 2019 04:40:26 -0500
Received: by mail-oi1-f196.google.com with SMTP id s71so8780279oih.11;
        Sat, 23 Nov 2019 01:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZFVPcc7HYr1DXGBw6B0Y4i+GsNOxok+nW/sn0ODa37c=;
        b=euWLHJsjDSHHUhkFQukkJpi2+WtZ1HbLt8BUlnTyoyjnbXvZphRUZ5t1XCw6ctv+A0
         3kZEr7epA1kbMe/eyMznLKzaL5PZf4vV+oenEeRhrZz+B/Jju7kFTImB4WMidU3SYgD9
         YiXBW5PGty7bH9evcidnP4y4UaLO7cTVUdHaYJ9MTsdLz+a+sLyTIVk0wYi+AwZJ3Hh5
         zBopbKC8G8wFzUBY3pvfkvn8rcm3U/AABEi5gkzb7FX4L3hO83HMwDsDR8/3XxrCSdn2
         kb0Qca99DNNeDl8qpcoy+kdLzXR9qv1REcKOsDFPpduKskFl/z+RaoXqorTpMZyNDkYQ
         h9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZFVPcc7HYr1DXGBw6B0Y4i+GsNOxok+nW/sn0ODa37c=;
        b=W+zxHWpDP6nD7oY3HmA0NcD4VcGC64onSuWh390Sbf9rUIPPw0fpJxo88TzLcbvqI5
         udB7dc/5q6ksOsI0KaZ9art34hfqKHqd5CErI7Ryy3hxuEvX3vkfwB8CThpDft2KUjug
         6rjHgOCcAyLZYJcSy46fgWULc8zaCwfLWMJfTRRyLzmiSx0ckDJ9djcjD5YypTIet6/G
         +Ed2Y98OrYyyCf3Vln0enD6N8dl2zDEViJKuOCpFti+QCplLdxVChH/EOzMk+dQMVebK
         3LfvN5cLSkTcXAOGO7tLir0QdPQki5vaZnzssUHvKihk5qAf0h0hWrdywSnJLDwLQTNY
         WhqA==
X-Gm-Message-State: APjAAAWueFDSK/nmOPmlYUKaqNqfYSBXiOUxgggCNoqWnF1KyycpJ4Jf
        b3aSOaqN7jW5N/hAFOa2Iv272TNwKXE58iBYqSk=
X-Google-Smtp-Source: APXvYqxEobYWB+wm8NZyoL31WGqKZIHUtoRQmBKv8NBLUHjYyBjG9p7RelpPqsHHAe1j6jp5XCOopaMypuZDTUeKleI=
X-Received: by 2002:a54:4815:: with SMTP id j21mr15579811oij.15.1574502023475;
 Sat, 23 Nov 2019 01:40:23 -0800 (PST)
MIME-Version: 1.0
References: <20191122225210.109172-1-colin.king@canonical.com>
In-Reply-To: <20191122225210.109172-1-colin.king@canonical.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 23 Nov 2019 10:40:12 +0100
Message-ID: <CAFBinCCd_jr7UDdQx15tnFnZwO1tCbJ+PnZtEn57LUDtiRV_eQ@mail.gmail.com>
Subject: Re: [PATCH] rtc: meson: remove redundant assignment to variable retries
To:     Colin King <colin.king@canonical.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Colin,

On Fri, Nov 22, 2019 at 11:52 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable retries is being initialized with a value that is never
> read and it is being updated later with a new value in a for-loop.
> The initialization is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
thank you for addressing this!
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Martin
