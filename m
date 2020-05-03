Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B76531C2C11
	for <lists+linux-rtc@lfdr.de>; Sun,  3 May 2020 14:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728479AbgECMF4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 3 May 2020 08:05:56 -0400
Received: from mout.web.de ([212.227.15.14]:41151 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728399AbgECMF4 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 3 May 2020 08:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1588507542;
        bh=XRnkz74ueXi7rmpVNxIQfdOIFfpQAIN5P21N1C+5fgI=;
        h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
        b=loiacN+rdQUubJGj8RvgXdnfnwwHaY3D4bTPZD/d1DSeUVYmTUg6Dkv/CAKQ3p4OP
         kjEORJfx9X+6JPTrgx6iBEafTtnTwlHXMPx51oAsBJEe1olvd7S7B5N5iAMoKH91H5
         o9B2ogPjgO26SC0rO0XZpgeX93v7AbmNAMdRtHhw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.26.31]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MsJP4-1jAnsa2k8o-00tgkS; Sun, 03
 May 2020 14:05:42 +0200
To:     Qiushi Wu <wu000273@umn.edu>, linux-rtc@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Kangjie Lu <kjlu@umn.edu>
Subject: Re: [PATCH] rtc: mc13xxx: fix a double-unlock issue
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <b9c82115-c70a-2381-f920-385846eb2a45@web.de>
Date:   Sun, 3 May 2020 14:05:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:r7ti0yaqPjZEg0G3BPTArXLw16yJ1eN2qi3RD8BlbOKZPEqi+1N
 Lskx+oD4qtJ4H2amvdIAotQty2g4d9EHNkp58XrLSOoJP+JATiabHBoI3llZoPpMHMeKyB9
 yrly8pwGZLFX56zU5ACG+1H5GYBu5u006WhpjTPlEb9/QBrIC13mOdpoGjXXhqRu4cPlwGC
 siDE0a4QgHjiOUlgwc28w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KvkWAnzfJjY=:JU9cUYviDny1KXAZd+Dl1F
 i9+RAxiRkEobBu9FIWjTVVUf+/HewUMEF+luaFwKFQooXDJsKzcXi9wLmQl5Dv5h74s0wD2Yq
 gIOQbSfHv05wCU5mgvt2AQvGt4zA/8p2Krxw7lfHVr09OfZwdUiXv4vfDitbgMCl+nVpR4wjV
 vH+XH7EhInPfA58T1QaCXTJtbD/b5a8dOpbPRFJY3sxfX2atVNXO3H5FfhzxLQdKRmB1jkVbK
 +Ttd+TqA7NUrGRalfOdsuA5mCayvPkdwqJ6F+SKW+/66K4WQiKvSBF2YLCJ83UhMobfu33FtB
 oGOuM7DPfxwdGD19N2PYDSwyWlc58aQnBxgjlNvIbPi/9bgxF2TlPY0OBwEGfQN+Yroz+OwOx
 Ge41ufM/QYCA3vYXoSI8limvNfBsnZdeMISbwFyYhx9e3q8zkdukkG9g1DXDM3TlYz/PRoBse
 JGBQuEyYDQNhiHi5mjbu1gpN/f2H/ssatexd3nuMHsvmbmcK6PBpCCrqPpPJO2oD4z3TL+Og5
 v+j/wHd4A2fhQXEEyUenWUvAjG3NnLaC3PFWL1YIE/xpVRuuGqL5q/DjUpGntf+VGFI3sbGg8
 nHSQY1GgcT3T56Rk3XCcoiU3NAkA4CHlkvC1gW2Yb9U2p2tfyr3HyQwJdiTLUGlblw6uS4xka
 kZtUnCUp7bxKZJxqBN3dr66BG3qFiWxAJMyEhASLc0KA4OqOTA/sIuf0vZSt7SO7ORb3Zoz2u
 0FssYn1QI3vxrOPbKZPedK/MQzNG+p8Nk5mTyIR4lmQHGjL7Ci0f2vr3XuB9z+crX+W4yaTf2
 xQig4/8MmK/8p77jjKn7NlC2LFajW1BD6K1ECg/GFoUHdSmqxx+emziKTq1IrsUAq9heWhu60
 TY5tDN7+TtsNM7xo5OSXbU4l3gI5SFn4IsDZGI4SJM3xFA7AEIOd/rxpV9zfPLTEysnRT/Ewi
 SIdBWwsE0gWqbMuw5cVB/4tYwWhnncBbanneo9V1Dj/LyT3mw5ilOoHFou+td9Ch6oBKRjfDB
 2Ya5uEScoaqnMwHqWCOv86ejZbo/B3OJbga0LtYXGN66cjtEWBkl30OTqc3Ne41IRarUG85L+
 L3TeoqfVG/+z/m/DtiQElMwCGO4Hdlta6cFh3xwNpE8g6ktpWZilv27XmSRxlJt8248ciP2bZ
 aMQG5tKg7SB35KhyhX3RXbAqggtdMruJstQ4M2NBUZrTVeTuE+MsGesMWkyH6dPuHVWe7BO3H
 73rcNgzlaa7Sz4yl0
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

> =E2=80=A6 To fix this problem,
> we need to call mc13xxx_lock() again in this error path.

How do you think about a wording variant like the following?

   Change description:
   =E2=80=A6
   Thus add a call of the function =E2=80=9Cmc13xxx_lock=E2=80=9D in an if=
 branch
   for the completion of the exception handling.


Would you like to add the tag =E2=80=9CFixes=E2=80=9D?

Regards,
Markus
