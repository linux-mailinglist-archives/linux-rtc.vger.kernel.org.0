Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2F6E1F9475
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2020 12:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729148AbgFOKST (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 15 Jun 2020 06:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729027AbgFOKSP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 15 Jun 2020 06:18:15 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA7E3C05BD43
        for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2020 03:18:13 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id u25so2706297lfm.1
        for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2020 03:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=km6g.us; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sssEHguXfPMznjLDOGFZd70IqPMOKBv9478w4I1VJG0=;
        b=CdGkL/47Bn71r+bigxqMk84KOjo3gl9YsmbhvZYtHrPm1xR9n2TM9PnjD70Q1iLtwQ
         n5fzqtRqxaDNVgyUas6IFIQmwT8U1LkYAN+P7YFZWq5MwzoaDQ8cvBMJ9P89yfQyua+U
         nZTZEFA3E5vSZw3sKt4ks797M3Np+iYKlDZlPnVLtWrygqXsM+KUqzdEB9Te2uAMEyfb
         T0UTK8tVMESO23edoszhgBIT3ot5G5Ec7mCM2wpPI8LyYlcwqJrceZ8aP/M7WcIEQMeB
         GaGfvKpw9dvgbAS371C9jC3IWb7WovuBZ9okBwoUDqsFsafmFuwqVxPQUUpL19XZ67sW
         Faog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sssEHguXfPMznjLDOGFZd70IqPMOKBv9478w4I1VJG0=;
        b=MBpJQeFfTUwob2HrAMoBZa6XLrp7Nalw7081xx+RkqCwjPW5H5yej7uLL3tJtrAwlo
         qFqejzcrM2TgyLKwUgTHvwecKGw5NvtsiS0z5ZQx7VzdFF0ClzrLJaN57yeT9DTynbs0
         e3L7fdk3FodvN+CquMkTvGJy/v0V+1rpWwRobMWIfXFTOiZTnkXbf41lRiF8Y8aBhXMq
         dYrs5AC6GIOqI8o6Xlop8JAmBhWVhcssGvuFPvHRpB92CEAibJX3yOXOsl3tGZ4rZpn9
         PGsk8kgr6o1yJ0qmTfiTX9xEiMbysx8fT14aY+xfEfdN+BfSwINg8XJXYiCBKaWAUHuD
         F/KA==
X-Gm-Message-State: AOAM530bZp67ZdEdE4Iilnira2Lj4iLcJ4N6iS3MwXV93ORLFyqc8Dru
        T5/io317aeWNsv/SzhD6f924j7+6VWI6fiaaPG7DYw==
X-Google-Smtp-Source: ABdhPJyuoAD7u+nQ9iaIHpvsQyQxeqti5NGREz3XVFkJ+hy+yL1NtGtGE92jbHSW1fGl+eP4Uv7UqRaPUtSqfzUfjt8=
X-Received: by 2002:a19:8307:: with SMTP id f7mr3545632lfd.174.1592216291683;
 Mon, 15 Jun 2020 03:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200612223551.282113-3-kevin+linux@km6g.us> <20200615094702.GI4151@kadam>
In-Reply-To: <20200615094702.GI4151@kadam>
From:   "Kevin P. Fleming" <kevin+linux@km6g.us>
Date:   Mon, 15 Jun 2020 06:18:00 -0400
Message-ID: <CAE+UdophKqb216hdsDtxkmJjXTEK-9Ry1oSzGqY-ShPFZa=QKA@mail.gmail.com>
Subject: Re: [PATCH 3/3 v2] rtc: abx80x: Add support for autocalibration
 filter capacitor
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kbuild@lists.01.org, "Kevin P. Fleming" <kevin+linux@km6g.us>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        lkp@intel.com, kbuild-all@lists.01.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Thanks for the bot-catch :-) WIll fix.

On Mon, Jun 15, 2020 at 5:47 AM Dan Carpenter <dan.carpenter@oracle.com> wr=
ote:
>
> Hi "Kevin,
>
> Thank you for the patch! Perhaps something to improve:
>
> url:    https://github.com/0day-ci/linux/commits/Kevin-P-Fleming/dt-bindi=
ngs-abx80x-Add-autocal-filter-property/20200613-063944
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.gi=
t rtc-next
> config: i386-randconfig-m021-20200612 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> smatch warnings:
> drivers/rtc/rtc-abx80x.c:821 abx80x_probe() error: uninitialized symbol '=
trickle_cfg'.
>
> # https://github.com/0day-ci/linux/commit/bbd3b3445f48810231c5f004a975116=
f19b37331
> git remote add linux-review https://github.com/0day-ci/linux
> git remote update linux-review
> git checkout bbd3b3445f48810231c5f004a975116f19b37331
> vim +/trickle_cfg +821 drivers/rtc/rtc-abx80x.c
>
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  700  static int abx80x_prob=
e(struct i2c_client *client,
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  701                       c=
onst struct i2c_device_id *id)
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  702  {
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  703       struct device_nod=
e *np =3D client->dev.of_node;
> af69f9a7878413 Jeremy Gebben      2018-09-11  704       struct abx80x_pri=
v *priv;
> bbd3b3445f4881 Kevin P. Fleming   2020-06-12  705       int i, data, err,=
 trickle_cfg, filter_cfg =3D -EINVAL;
>                                                                          =
 ^^^^^^^^^^^
>
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  706       char buf[7];
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  707       unsigned int part=
 =3D id->driver_data;
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  708       unsigned int part=
number;
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  709       unsigned int majr=
ev, minrev;
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  710       unsigned int lot;
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  711       unsigned int wafe=
r;
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  712       unsigned int uid;
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  713
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  714       if (!i2c_check_fu=
nctionality(client->adapter, I2C_FUNC_I2C))
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  715               return -E=
NODEV;
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  716
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  717       err =3D i2c_smbus=
_read_i2c_block_data(client, ABX8XX_REG_ID0,
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  718                        =
                   sizeof(buf), buf);
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  719       if (err < 0) {
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  720               dev_err(&=
client->dev, "Unable to read partnumber\n");
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  721               return -E=
IO;
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  722       }
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  723
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  724       partnumber =3D (b=
uf[0] << 8) | buf[1];
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  725       majrev =3D buf[2]=
 >> 3;
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  726       minrev =3D buf[2]=
 & 0x7;
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  727       lot =3D ((buf[4] =
& 0x80) << 2) | ((buf[6] & 0x80) << 1) | buf[3];
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  728       uid =3D ((buf[4] =
& 0x7f) << 8) | buf[5];
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  729       wafer =3D (buf[6]=
 & 0x7c) >> 2;
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  730       dev_info(&client-=
>dev, "model %04x, revision %u.%u, lot %x, wafer %x, uid %x\n",
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  731                partnumb=
er, majrev, minrev, lot, wafer, uid);
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  732
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  733       data =3D i2c_smbu=
s_read_byte_data(client, ABX8XX_REG_CTRL1);
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  734       if (data < 0) {
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  735               dev_err(&=
client->dev, "Unable to read control register\n");
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  736               return -E=
IO;
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  737       }
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  738
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  739       err =3D i2c_smbus=
_write_byte_data(client, ABX8XX_REG_CTRL1,
> 718a820a303ca6 Alexandre Belloni  2015-12-17  740                        =
               ((data & ~(ABX8XX_CTRL_12_24 |
> 718a820a303ca6 Alexandre Belloni  2015-12-17  741                        =
                          ABX8XX_CTRL_ARST)) |
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  742                        =
                ABX8XX_CTRL_WRITE));
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  743       if (err < 0) {
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  744               dev_err(&=
client->dev, "Unable to write control register\n");
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  745               return -E=
IO;
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  746       }
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  747
> 75455e258ea2b3 Marek Vasut        2019-01-29  748       /* Configure RV18=
05 specifics */
> 75455e258ea2b3 Marek Vasut        2019-01-29  749       if (part =3D=3D R=
V1805) {
> 75455e258ea2b3 Marek Vasut        2019-01-29  750               /*
> 75455e258ea2b3 Marek Vasut        2019-01-29  751                * Avoid =
accidentally entering test mode. This can happen
> 75455e258ea2b3 Marek Vasut        2019-01-29  752                * on the=
 RV1805 in case the reserved bit 5 in control2
> 75455e258ea2b3 Marek Vasut        2019-01-29  753                * regist=
er is set. RV-1805-C3 datasheet indicates that
> 75455e258ea2b3 Marek Vasut        2019-01-29  754                * the bi=
t should be cleared in section 11h - Control2.
> 75455e258ea2b3 Marek Vasut        2019-01-29  755                */
> 75455e258ea2b3 Marek Vasut        2019-01-29  756               data =3D =
i2c_smbus_read_byte_data(client, ABX8XX_REG_CTRL2);
> 75455e258ea2b3 Marek Vasut        2019-01-29  757               if (data =
< 0) {
> 75455e258ea2b3 Marek Vasut        2019-01-29  758                       d=
ev_err(&client->dev,
> 75455e258ea2b3 Marek Vasut        2019-01-29  759                        =
       "Unable to read control2 register\n");
> 75455e258ea2b3 Marek Vasut        2019-01-29  760                       r=
eturn -EIO;
> 75455e258ea2b3 Marek Vasut        2019-01-29  761               }
> 75455e258ea2b3 Marek Vasut        2019-01-29  762
> 75455e258ea2b3 Marek Vasut        2019-01-29  763               err =3D i=
2c_smbus_write_byte_data(client, ABX8XX_REG_CTRL2,
> 75455e258ea2b3 Marek Vasut        2019-01-29  764                        =
                       data & ~ABX8XX_CTRL2_RSVD);
> 75455e258ea2b3 Marek Vasut        2019-01-29  765               if (err <=
 0) {
> 75455e258ea2b3 Marek Vasut        2019-01-29  766                       d=
ev_err(&client->dev,
> 75455e258ea2b3 Marek Vasut        2019-01-29  767                        =
       "Unable to write control2 register\n");
> 75455e258ea2b3 Marek Vasut        2019-01-29  768                       r=
eturn -EIO;
> 75455e258ea2b3 Marek Vasut        2019-01-29  769               }
> 75455e258ea2b3 Marek Vasut        2019-01-29  770
> 75455e258ea2b3 Marek Vasut        2019-01-29  771               /*
> 75455e258ea2b3 Marek Vasut        2019-01-29  772                * Avoid =
extra power leakage. The RV1805 uses smaller
> 75455e258ea2b3 Marek Vasut        2019-01-29  773                * 10pin =
package and the EXTI input is not present.
> 75455e258ea2b3 Marek Vasut        2019-01-29  774                * Disabl=
e it to avoid leakage.
> 75455e258ea2b3 Marek Vasut        2019-01-29  775                */
> 75455e258ea2b3 Marek Vasut        2019-01-29  776               data =3D =
i2c_smbus_read_byte_data(client, ABX8XX_REG_OUT_CTRL);
> 75455e258ea2b3 Marek Vasut        2019-01-29  777               if (data =
< 0) {
> 75455e258ea2b3 Marek Vasut        2019-01-29  778                       d=
ev_err(&client->dev,
> 75455e258ea2b3 Marek Vasut        2019-01-29  779                        =
       "Unable to read output control register\n");
> 75455e258ea2b3 Marek Vasut        2019-01-29  780                       r=
eturn -EIO;
> 75455e258ea2b3 Marek Vasut        2019-01-29  781               }
> 75455e258ea2b3 Marek Vasut        2019-01-29  782
> 75455e258ea2b3 Marek Vasut        2019-01-29  783               /*
> 75455e258ea2b3 Marek Vasut        2019-01-29  784                * Write =
the configuration key register to enable access to
> 75455e258ea2b3 Marek Vasut        2019-01-29  785                * the co=
nfig2 register
> 75455e258ea2b3 Marek Vasut        2019-01-29  786                */
> fee83bca1a1fde Kevin P. Fleming   2020-06-12  787               if (abx80=
x_write_config_key(client, ABX8XX_CFG_KEY_MISC) < 0)
> 75455e258ea2b3 Marek Vasut        2019-01-29  788                       r=
eturn -EIO;
> 75455e258ea2b3 Marek Vasut        2019-01-29  789
> 75455e258ea2b3 Marek Vasut        2019-01-29  790               err =3D i=
2c_smbus_write_byte_data(client, ABX8XX_REG_OUT_CTRL,
> 75455e258ea2b3 Marek Vasut        2019-01-29  791                        =
                       data | ABX8XX_OUT_CTRL_EXDS);
> 75455e258ea2b3 Marek Vasut        2019-01-29  792               if (err <=
 0) {
> 75455e258ea2b3 Marek Vasut        2019-01-29  793                       d=
ev_err(&client->dev,
> 75455e258ea2b3 Marek Vasut        2019-01-29  794                        =
       "Unable to write output control register\n");
> 75455e258ea2b3 Marek Vasut        2019-01-29  795                       r=
eturn -EIO;
> 75455e258ea2b3 Marek Vasut        2019-01-29  796               }
> 75455e258ea2b3 Marek Vasut        2019-01-29  797       }
> 75455e258ea2b3 Marek Vasut        2019-01-29  798
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  799       /* part autodetec=
tion */
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  800       if (part =3D=3D A=
BX80X) {
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  801               for (i =
=3D 0; abx80x_caps[i].pn; i++)
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  802                       i=
f (partnumber =3D=3D abx80x_caps[i].pn)
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  803                        =
       break;
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  804               if (abx80=
x_caps[i].pn =3D=3D 0) {
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  805                       d=
ev_err(&client->dev, "Unknown part: %04x\n",
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  806                        =
       partnumber);
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  807                       r=
eturn -EINVAL;
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  808               }
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  809               part =3D =
i;
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  810       }
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  811
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  812       if (partnumber !=
=3D abx80x_caps[part].pn) {
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  813               dev_err(&=
client->dev, "partnumber mismatch %04x !=3D %04x\n",
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  814                       p=
artnumber, abx80x_caps[part].pn);
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  815               return -E=
INVAL;
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  816       }
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  817
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  818       if (np && abx80x_=
caps[part].has_tc)
> 6e429f6b8c6b8f Kevin P. Fleming   2020-05-30  819               trickle_c=
fg =3D abx80x_dt_trickle_cfg(client);
>                                                                 ^^^^^^^^^=
^^^^
> Not initialized on else path.
>
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  820
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05 @821       if (trickle_cfg >=
 0) {
>                                                             ^^^^^^^^^^^
>
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  822               dev_info(=
&client->dev, "Enabling trickle charger: %02x\n",
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  823                        =
trickle_cfg);
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  824               abx80x_en=
able_trickle_charger(client, trickle_cfg);
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  825       }
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  826
> 718a820a303ca6 Alexandre Belloni  2015-12-17  827       err =3D i2c_smbus=
_write_byte_data(client, ABX8XX_REG_CD_TIMER_CTL,
> 718a820a303ca6 Alexandre Belloni  2015-12-17  828                        =
               BIT(2));
> 718a820a303ca6 Alexandre Belloni  2015-12-17  829       if (err)
> 718a820a303ca6 Alexandre Belloni  2015-12-17  830               return er=
r;
> 718a820a303ca6 Alexandre Belloni  2015-12-17  831
> af69f9a7878413 Jeremy Gebben      2018-09-11  832       priv =3D devm_kza=
lloc(&client->dev, sizeof(*priv), GFP_KERNEL);
> af69f9a7878413 Jeremy Gebben      2018-09-11  833       if (priv =3D=3D N=
ULL)
> af69f9a7878413 Jeremy Gebben      2018-09-11  834               return -E=
NOMEM;
> af69f9a7878413 Jeremy Gebben      2018-09-11  835
> af69f9a7878413 Jeremy Gebben      2018-09-11  836       priv->rtc =3D dev=
m_rtc_allocate_device(&client->dev);
> af69f9a7878413 Jeremy Gebben      2018-09-11  837       if (IS_ERR(priv->=
rtc))
> af69f9a7878413 Jeremy Gebben      2018-09-11  838               return PT=
R_ERR(priv->rtc);
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  839
> af69f9a7878413 Jeremy Gebben      2018-09-11  840       priv->rtc->ops =
=3D &abx80x_rtc_ops;
> af69f9a7878413 Jeremy Gebben      2018-09-11  841       priv->client =3D =
client;
> 9360a6a81862d3 Alexandre Belloni  2017-10-13  842
> af69f9a7878413 Jeremy Gebben      2018-09-11  843       i2c_set_clientdat=
a(client, priv);
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  844
> 749e36d0a0d725 Jeremy Gebben      2018-09-11  845       if (abx80x_caps[p=
art].has_wdog) {
> 749e36d0a0d725 Jeremy Gebben      2018-09-11  846               err =3D a=
bx80x_setup_watchdog(priv);
> 749e36d0a0d725 Jeremy Gebben      2018-09-11  847               if (err)
> 749e36d0a0d725 Jeremy Gebben      2018-09-11  848                       r=
eturn err;
> 749e36d0a0d725 Jeremy Gebben      2018-09-11  849       }
> 749e36d0a0d725 Jeremy Gebben      2018-09-11  850
> bbd3b3445f4881 Kevin P. Fleming   2020-06-12  851       if (of_property_r=
ead_u32(np, "abracon,autocal_filter", &filter_cfg) =3D=3D 0) {
> bbd3b3445f4881 Kevin P. Fleming   2020-06-12  852               err =3D a=
bx80x_set_autocal_filter(client,
> bbd3b3445f4881 Kevin P. Fleming   2020-06-12  853                        =
                       filter_cfg ?
> bbd3b3445f4881 Kevin P. Fleming   2020-06-12  854                        =
                       ABX8XX_AUTOCAL_FILTER_ENABLE :
> bbd3b3445f4881 Kevin P. Fleming   2020-06-12  855                        =
                       ABX8XX_AUTOCAL_FILTER_DISABLE);
> bbd3b3445f4881 Kevin P. Fleming   2020-06-12  856               if (err)
> bbd3b3445f4881 Kevin P. Fleming   2020-06-12  857                       r=
eturn err;
> bbd3b3445f4881 Kevin P. Fleming   2020-06-12  858       }
> bbd3b3445f4881 Kevin P. Fleming   2020-06-12  859
> 718a820a303ca6 Alexandre Belloni  2015-12-17  860       if (client->irq >=
 0) {
> 718a820a303ca6 Alexandre Belloni  2015-12-17  861               dev_info(=
&client->dev, "IRQ %d supplied\n", client->irq);
> 718a820a303ca6 Alexandre Belloni  2015-12-17  862               err =3D d=
evm_request_threaded_irq(&client->dev, client->irq, NULL,
> 718a820a303ca6 Alexandre Belloni  2015-12-17  863                        =
                       abx80x_handle_irq,
> 718a820a303ca6 Alexandre Belloni  2015-12-17  864                        =
                       IRQF_SHARED | IRQF_ONESHOT,
> 718a820a303ca6 Alexandre Belloni  2015-12-17  865                        =
                       "abx8xx",
> 718a820a303ca6 Alexandre Belloni  2015-12-17  866                        =
                       client);
> 718a820a303ca6 Alexandre Belloni  2015-12-17  867               if (err) =
{
> 718a820a303ca6 Alexandre Belloni  2015-12-17  868                       d=
ev_err(&client->dev, "unable to request IRQ, alarms disabled\n");
> 718a820a303ca6 Alexandre Belloni  2015-12-17  869                       c=
lient->irq =3D 0;
> 718a820a303ca6 Alexandre Belloni  2015-12-17  870               }
> 718a820a303ca6 Alexandre Belloni  2015-12-17  871       }
> 718a820a303ca6 Alexandre Belloni  2015-12-17  872
> 559e883e0f7768 Alexandre Belloni  2019-03-06  873       err =3D rtc_add_g=
roup(priv->rtc, &rtc_calib_attr_group);
> 59a8383adb7545 Myl=C3=A8ne Josserand   2016-03-21  874       if (err) {
> 59a8383adb7545 Myl=C3=A8ne Josserand   2016-03-21  875               dev_=
err(&client->dev, "Failed to create sysfs group: %d\n",
> 59a8383adb7545 Myl=C3=A8ne Josserand   2016-03-21  876                   =
    err);
> 59a8383adb7545 Myl=C3=A8ne Josserand   2016-03-21  877               retu=
rn err;
> 59a8383adb7545 Myl=C3=A8ne Josserand   2016-03-21  878       }
> 59a8383adb7545 Myl=C3=A8ne Josserand   2016-03-21  879
> 559e883e0f7768 Alexandre Belloni  2019-03-06  880       return rtc_regist=
er_device(priv->rtc);
> 4d61ff6b9960cb Philippe De Muyter 2015-05-05  881  }
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
