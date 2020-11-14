Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 665BD2B2CE4
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Nov 2020 12:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726356AbgKNLZu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Nov 2020 06:25:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgKNLZu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Nov 2020 06:25:50 -0500
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D393DC0613D1
        for <linux-rtc@vger.kernel.org>; Sat, 14 Nov 2020 03:25:48 -0800 (PST)
Received: by mail-yb1-xb44.google.com with SMTP id k65so11197360ybk.5
        for <linux-rtc@vger.kernel.org>; Sat, 14 Nov 2020 03:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=oCh7zLnDTpH16tMp5jixVUXV+XUKvX3ngLZQDxFzJp4=;
        b=TDKEkipAprOr7CSpx/GLz2O8CAmiYN8QrAnqk6HBidfWQcD0t3dtCsF2yyw+08kBIf
         aR687gsVeh1wtX577GU03RVBQwb5Z4eqJF/mgfpTaPHFqG8UwZsakwmf9V8jqS8Y5e29
         FWrYuX1Xa164uT8opVlblWf1GzFDnfBKwLeV8iAfB8rX2u7GIzW14RdFRHiIEsO9b6FJ
         f5Sut6SAk4LqT2EPULNxvG9aRXr+VhKLnZvKea/PySRTIgRF9bcX24t9szsFaMAuqp6a
         x1V+dVJ4BbYaDNTmVedSfeMFJ2xLH9WSOYlZxXQwlOu7XzJ9S7Y0A+jiMv7bNJCReWla
         jctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=oCh7zLnDTpH16tMp5jixVUXV+XUKvX3ngLZQDxFzJp4=;
        b=sHruhmmZPfoM23Kc3TIynqn1cqL/OMhG7N+05d+5AsekO95Z8QFbajrcFwVgl0yNv4
         Nmd15VnnkfhyjrQqiPvGthdx2/wnzg5fnUEuHQ/nl99z65luFU354mCWjZxo+UfHPzKG
         1KhBlP3p2GfmMA/zlQZ9nBdSXCnRFwIdax3fWcAk1CdJlervzawtXgSRu+8+WsnuW/Sh
         H/ndOW5+XcHN9m5+Hl5wrrCO3PgbxnR3wiNLgsXSmIqRgT6s5qy6eRQ/xMw3gl1+EsqY
         bzXCC5gWfmq52aRrYtjcNlsy/4XGnTXdTSVJnXaXq7RozZFjEhiTIzIyrF/7jAIHEqiQ
         XehA==
X-Gm-Message-State: AOAM5332uNJE/JeliMDlyF0cBISPcF6qpATtwZT3mVoK9gf69TilPRQ6
        CC2zcz82QfwGV1ZrRpepvgPPNgU6Uiyq3cqJnpw=
X-Google-Smtp-Source: ABdhPJxb7HCSsfaszatRjy5I3G67NzBmBu6YIjn3Fs1f8epho501yAIiBMY3ptVfvtyI4CjgfmH4lM8EydZh2SBKh4Q=
X-Received: by 2002:a25:8006:: with SMTP id m6mr8041466ybk.57.1605353148171;
 Sat, 14 Nov 2020 03:25:48 -0800 (PST)
MIME-Version: 1.0
Reply-To: mohammedsaas190@gmail.com
Sender: mrsnicolemarois0@gmail.com
Received: by 2002:a05:7110:525c:b029:2b:ca73:b06d with HTTP; Sat, 14 Nov 2020
 03:25:47 -0800 (PST)
From:   Mohammed Saad <mohammedsaadht@gmail.com>
Date:   Sat, 14 Nov 2020 03:25:47 -0800
X-Google-Sender-Auth: Zunk80BqloYx4rSkCqvdCIIqU-g
Message-ID: <CAF7qY1zgLCD+87LHAbZb66=Jx95kyUSJxhKbNFN0tdPbykrEFQ@mail.gmail.com>
Subject: OK
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Greetings,

I humbly solicit for your partnership to transfer =E2=82=AC15 million Euros
into your personal or company=E2=80=99s account .Contact me for more detail=
ed
explanation.

Kindly send me the followings

Full Names
Address
Occupation
Direct Mobile Telephone Lines
Nationality

Mohammed Saad
