Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFF921E5BAB
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2020 11:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728190AbgE1JR6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 28 May 2020 05:17:58 -0400
Received: from mout.web.de ([212.227.15.3]:43509 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728131AbgE1JR5 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 28 May 2020 05:17:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1590657467;
        bh=idng5Kr0BOpFJyssXXijBaX3uKHCBuc3xkHSzVXcUSc=;
        h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
        b=hw7GxZn+fAaejnzj0rJaE8vehg/QpReJ5ifDip20ObBXkndW4OcIA27xhrnqYOohN
         ICIFuITH2KN9tn6eP8Ma1KIhK7PdFw/N/k7w1Y5e6UgiIl+X+xkLhGTlxKjFoSp/82
         wt1ozki3FKHXwO7V5aSz+talwYx09E6hI1tQ/gnQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.155.229]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MS29q-1jSngH28gk-00TCCt; Thu, 28
 May 2020 11:17:47 +0200
To:     Chuhong Yuan <hslester96@gmail.com>, linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH] rtc: rv3028: Add missed check for devm_regmap_init_i2c()
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <6eb98232-bc84-0854-243a-e54b91f2bda6@web.de>
Date:   Thu, 28 May 2020 11:17:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:anDq+fzid6dh8DfhDlDsVj2Gsh8+7dmV0eqSmKcd425Patt5NXp
 yVB2IJEENHqDKkCpsmVnc+cDU8KOmfCTSE8mvElGa8tdF4xqP7heigyDxloELfiKWeQlKUi
 TvW4vsGevOJLtr6Yhhf1+Mohu7PS2woL0ArxwIE1ftHTe5E2Ysp+nuijzjVQpbVAFE3GHqd
 XWRhgCEYJtgD2KUt6ueOg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ne2764nO9Dw=:g7e+2+9YTcvj7a1/iRncXZ
 KdaFAE23goZG5d7EcL9xq0ZatT7XdToXFA/5fPCIvIK0CqzXH/swRAqiVIAs6IPQwtDbHTD9/
 0Hh9TD8Qjl+b+l/teKqzSPArRyQnO2nx+Ili/hcgqfDSbCVvN0qZZ9crooSrjw1K/Q/23qt77
 zzpj6pagVV3NNB1b2yzIHkkf+hazdjtazNT7yRlng1celG4OaaRJNl0du3mtNZYsQzIiXklBD
 5eAFWkN9ifmEBobzm2XOFp9XZjxND6lzoSSWAcl081SYNSF4n9UEc2HsWA85MGXnJoLiTI2NQ
 2YQ/t+QrbT9f57HfPpK5kBbHiA8Sdo7oLkrMB2teZoa1kOT+VRqFiErChVwp7caKuXIee2VnX
 W4jEBJ35bVbY9WImX8sHWWfblt8fOlmX5XhwHzPT90wgwqpKuSGvW4dP6PW0XkxiMR71jjkHa
 r6m9geek6YhSUsq7cIxtyVo7NPqYh1S+pBzIcUSC/Q0KOgrcAawqy0/F9SaBkHnNbscpp2RPJ
 3rUqMkd87CQxHBO+ThTavpdWghEpTxI1tKVAtaVH8SE3Utl9/vINA2d+HYbiweILMuvy1RsvA
 46WYEcO2Xs8UZ7P3qOv+y5gQ9Cc2Bx9dpMm/stYnIUaa0Jg+Z9hezFB6zJvHUm0pmUbK7uDHe
 kXQrkKXRJvBL6j7Cqhqaci3WylE3482cC87aYxoN8v2FmTTaRiEvCdp/4dGS03mqWY6nlASn6
 Uehi20OGiETTepaAYCaPb4rJP1wJOM5ynvSaHF+uv7Y8PWDM/LVVJZaugmt2NMuZtqPLlJW4A
 JYF+hDNOdBA1DwOPggO+j097LobgmQVm9H3XC9wQWb/CXPQJ4T6JXsop1EuaXaLu2W/9XVrNw
 meh8indUltFi5dyEflqJV8MdEW57VrmJJ+ZHXIZ1/q+wmpyMS2z2YgIbq2cuKkMHRyphcCDU2
 a618Zac5heWpQ2PA4tqyGhdjcDNfdkWaHSIM+m5LaCAV2ZEgiwa7zXPWvyBPpHe05OrA+B4SR
 m0lVDcjE2mUCxJoB0s2WXnotFwME8xjwJL+FBXRTNFabafQ6fjhBWtKt84ZoCdBHlJogX+Op9
 JB5B0ftWRKo/oOsr36u7sw5lbI9TgtY8B6qRX8fhxn5Az9cfv3YFTw2awGLsdB1ssCnxO5X9B
 kL6DA84amoPamIUZ8gAxBLFklko+CTVa3J7eJK8QrvoL/flHwNomj1jLLOka7DofAnxnbpXba
 ojBN3ft02LPrrDdVI
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

> rv3028_probe() misses a check for devm_regmap_init_i2c().

Such information is helpful.


> Add the missed check

Thanks for another completion of the exception handling.


>                      to fix it.

I suggest to replace this wording by the tag =E2=80=9CFixes=E2=80=9D for t=
he commit message.
How do you think about to take this possibility into account
for any more patches?

Regards,
Markus
