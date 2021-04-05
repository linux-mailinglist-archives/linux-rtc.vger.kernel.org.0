Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5A7635419C
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Apr 2021 13:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbhDELkW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Apr 2021 07:40:22 -0400
Received: from mail-lf1-f43.google.com ([209.85.167.43]:44642 "EHLO
        mail-lf1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232755AbhDELkW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Apr 2021 07:40:22 -0400
Received: by mail-lf1-f43.google.com with SMTP id d12so16929100lfv.11;
        Mon, 05 Apr 2021 04:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=zIXXSCqMXDob1DAPG5CCbwNP2i92dYCSQ1Gjx9Ia5QE=;
        b=A6NrUmbdslsnvgPJDt5MOGd/dgX7GjJe8s579FSpuKS/dRImVc1umbgc2OhsaifYAZ
         vKJ8HnlFd+p6XubGdI14PE64cPqeTcipDoZ88+ah44qVsaTsXxRUZjiv1Rln242T0axz
         1BxUEG4cap3HxW2ju/O1dRRyKBOwhaDxFNncBM/ioK126pcka1ReQd33O3twTNeOccSr
         jMjPXqgttjtftmK9Ni/G4XLdYbGkxBPLt/7B3FC6XWrdSrkU+Ltiqklonm+5m2JIYWlR
         5zQCzCIwgT9frDt76lQNWbRJU3G8WLx/SjYTCDfd9jqB6hw/v6eisAO1ajd8h9uVcpwW
         XL/A==
X-Gm-Message-State: AOAM532ad7FP4z2P42DdyYVAtUchHRRxG8cmyRcC3z8xub8EZ8cIaSnX
        ilBi+P3EPz/pvp9aiwH5PHQ=
X-Google-Smtp-Source: ABdhPJwKaAC8+FP0vP4kjp8sh+KI9jXnex5lyylHDRAC4RmeaqgtD6ACmuyVwhKzaUDsF/vFYgb2NA==
X-Received: by 2002:a05:6512:504:: with SMTP id o4mr16628598lfb.438.1617622814783;
        Mon, 05 Apr 2021 04:40:14 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id r3sm1842666ljn.13.2021.04.05.04.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 04:40:13 -0700 (PDT)
Date:   Mon, 5 Apr 2021 14:40:06 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v6 00/16] Support ROHM BD71815 PMIC
Message-ID: <cover.1617616855.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Patch series introducing support for ROHM BD71815 PMIC

ROHM BD71815 is a power management IC used in some battery powered
systems. It contains regulators, GPO(s), charger + coulomb counter, RTC
and a clock gate.

All regulators can be controlled via I2C. LDO4 can additionally be set to
be enabled/disabled by a GPIO. LDO3 voltage could be selected from two
voltages written into separate VSEL reisters using GPIO but this mode is
not supported by driver. On top of that the PMIC has the typical HW
state machine which is present also on many other ROHM PMICs.

IC contains two GPOs - but one of the GPOs is marked as GND in
data-sheet. Thus the driver by default only exposes one GPO. The second
GPO can be enabled by special DT property.

RTC is almost similar to what is on BD71828. For currently used features
only the register address offset to RTC block differs.

The charger driver is not included in this series. ROHM has a charger
driver with some fuel-gauging logig written in but this is not included
here. I am working on separating the logic from HW specific driver and
supporting both BD71815 and BD71828 chargers in separate patch series.

Changelog v6:
  Rebased on v5.12-rc6
  Regulator:
   - Fixed few minor issues pointer by Mark
   - Dropped the helper patches which were applied to regulator tree.
     Please note, there is compile-time dependency to those helpers so
     regulator helpers should be pulled in from:
     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git
     tags/regulator-list-ramp-helpers
  GPIO:
   - Corrected change log spelling
   - Fixes some styling issues pointed by Andy.
Changelog v5:
  Regulator:
  - Added regmap helper for regulator ramp-delay and taken it in use
    (patches 13, 14, 16 - they can be just dropped if ramp-delay helper is not
    a good idea. Patch 15 implements old-fashioned ramp-delay)
  GPIO:
  - styling changes to GPIO (Mostly suggested by Andy)
  - implemented init_valid_mask (but can't count on it yet)
Changelog v4:
  - Sorted ROHM chip ID enum
  - Statcized DVS structures in regulator driver
  - Minor styling for regulator driver
  - rebased on v5.12-rc4
Changelog v3:
  - GPIO clean-up as suggested by Bartosz
  - MFD clean-up as suggested by Lee
  - clk-mode dt-binding handling in MFD driver corrected to reflect new
    property values.
  - Dropped already applied patches
  - Rebased on v5.12-rc2
Changelog v2:
  - Rebased on top of v5.11-rc3
  - Added another "preliminary patch" which fixes HW-dvs voltage
    handling (patch 1)
  - split regulator patch to two.
  - changed dt-binding patch ordering.
  regulators:
    - staticized probe
    - removed some unnecessary defines
    - updated comments
    - split rohm-regulator patch adding SNVS and supporting simple
      linear mapping into two - one adding support for mapping, other
      adding SNVS.
  GPIO:
    - removed unnecessary headers
    - clarified dev/parent->dev usage
    - removed forgotten #define DEBUG
  dt-bindings:
    - changed patch order to meet ref-dependencies
    - added missing regulator nodes
    - changed string property for clk mode to tristated
  MFD:
    - header cleanups.
  CLK:
    - fixed commit message

--

Matti Vaittinen (16):
  rtc: bd70528: Do not require parent data
  mfd: bd718x7: simplify by cleaning unnecessary device data
  dt_bindings: bd71828: Add clock output mode
  dt_bindings: regulator: Add ROHM BD71815 PMIC regulators
  dt_bindings: mfd: Add ROHM BD71815 PMIC
  mfd: Add ROHM BD71815 ID
  mfd: Sort ROHM chip ID list for better readability
  mfd: Support for ROHM BD71815 PMIC core
  gpio: support ROHM BD71815 GPOs
  regulator: rohm-regulator: linear voltage support
  regulator: rohm-regulator: Support SNVS HW state.
  regulator: bd718x7, bd71828: Use ramp-delay helper
  regulator: Support ROHM BD71815 regulators
  clk: bd718x7: Add support for clk gate on ROHM BD71815 PMIC
  rtc: bd70528: Support RTC on ROHM BD71815
  MAINTAINERS: Add ROHM BD71815AGW

 .../bindings/mfd/rohm,bd71815-pmic.yaml       | 201 ++++++
 .../bindings/mfd/rohm,bd71828-pmic.yaml       |   6 +
 .../regulator/rohm,bd71815-regulator.yaml     | 116 ++++
 MAINTAINERS                                   |   3 +
 drivers/clk/clk-bd718x7.c                     |   9 +-
 drivers/gpio/Kconfig                          |  10 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-bd71815.c                   | 185 +++++
 drivers/mfd/Kconfig                           |  15 +-
 drivers/mfd/rohm-bd71828.c                    | 486 +++++++++----
 drivers/mfd/rohm-bd718x7.c                    |  43 +-
 drivers/regulator/Kconfig                     |  11 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/bd71815-regulator.c         | 652 ++++++++++++++++++
 drivers/regulator/bd71828-regulator.c         |  51 +-
 drivers/regulator/bd718x7-regulator.c         |  60 +-
 drivers/regulator/rohm-regulator.c            |  23 +-
 drivers/rtc/Kconfig                           |   6 +-
 drivers/rtc/rtc-bd70528.c                     | 104 +--
 include/linux/mfd/rohm-bd71815.h              | 562 +++++++++++++++
 include/linux/mfd/rohm-bd71828.h              |   3 +
 include/linux/mfd/rohm-bd718x7.h              |  13 -
 include/linux/mfd/rohm-generic.h              |  15 +-
 23 files changed, 2286 insertions(+), 290 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71815-pmic.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml
 create mode 100644 drivers/gpio/gpio-bd71815.c
 create mode 100644 drivers/regulator/bd71815-regulator.c
 create mode 100644 include/linux/mfd/rohm-bd71815.h


base-commit: e49d033bddf5b565044e2abe4241353959bc9120
-- 
2.25.4


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
